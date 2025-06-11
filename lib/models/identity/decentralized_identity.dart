import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:get/get.dart';
import 'package:bt_wallet_flutter_01/models/amount.dart';
import 'package:bt_wallet_flutter_01/models/dcep/dcep.dart';
import 'package:bt_wallet_flutter_01/models/did.dart';
import 'package:bt_wallet_flutter_01/models/identity/account_info.dart';
import 'package:bt_wallet_flutter_01/models/identity/health_info.dart';
import 'package:bt_wallet_flutter_01/models/identity/profile_info.dart';
import 'package:bt_wallet_flutter_01/models/serializer.dart';
import 'package:bt_wallet_flutter_01/service/api_provider.dart';
import 'package:bt_wallet_flutter_01/service/blockchain_service.dart';
import 'package:bt_wallet_flutter_01/service/contract_service.dart';
import 'package:bt_wallet_flutter_01/store/dcep_store.dart';
import 'package:bt_wallet_flutter_01/store/identity_store.dart';
import 'package:bt_wallet_flutter_01/store/mnemonics.dart';
import 'package:uuid/uuid.dart';
import 'package:web3dart/credentials.dart';

part 'decentralized_identity.g.dart';

abstract class DecentralizedIdentity extends Object
  implements Built<DecentralizedIdentity, DecentralizedIdentityBuilder> {

  static Serializer<DecentralizedIdentity> get serializer =>
      _$decentralizedIdentitySerializer;

  /// Unique identifier
  String get id;

  /// ID of the decentralized application (DApp) the identity belongs to.
  String get dappId;

  /// Personal profile information like name, avatar, etc.
  ProfileInfo get profileInfo;

  /// Public/private key info and balance (see earlier model).
  AccountInfo get accountInfo;

  /// Health-related data
  HealthInfo get healthInfo;

  /// Optional extra metadata.
  String? get extra;

  @memoized
  String get address =>
    BlockChainService.publicKeyToAddress(accountInfo.pubKey.substring(2));

  /// DID stands for Decentralized Identifier
  @memoized
  DID get did => DID.fromEthAddress(EthereumAddress.fromHex(address));

  Map<String, dynamic> basicInfo() => {
    'id': id,
    'address': address,
    'publicKey': accountInfo.pubKey,
    'index': accountInfo.index,
    'extra': extra
  };

  factory DecentralizedIdentity([void Function(DecentralizedIdentityBuilder)? updates]) =>
    _$DecentralizedIdentity(
      (builder) => builder
        ..id = const Uuid().v1()
        ..dappId = ""
        ..extra = ""
        ..update(updates),
    );

  Future<bool> register() async {
    return Get.find<ContractService>().identitiesContract!.sendTransaction(
      Get.find<MnemonicsStore>().firstPrivateKey,
      'registerIdentity',
      [
        profileInfo.name,
        did.toString(),
        dappId,
        BigInt.from(accountInfo.index),
        extra,
        accountInfo.pubKey,
      ]
    ).then((success) {
      if (success) {
        Get.find<IdentityStore>().addIdentity(identity: this);
      }
      return success;
    });
  }

  Future<void> redeemDcep(DcepType type) {
    return Get.find<ApiProvider>().redeemDcepV2(address, type).then(
      (res) => res.ifPresent((dcep) {
        if (dcep.verify()) {
          if (dcep.owner == address) {
            Get.find<DcepStore>().add(dcep);
          }
        }
      }),
    );
  }

  Future<String> signOfflinePayment(BigInt bill, String toAddress, int nonce) {
    return Get.find<ContractService>().nftTokenContract!.signContractCall(
      accountInfo.priKey,
      'safeTransferFrom',
      [
        EthereumAddress.fromHex(address),
        EthereumAddress.fromHex(toAddress),
        bill
      ],
      nonce: nonce,
    );
  }

  Future<bool> transferPoint({required String toAddress, required Amount amount}) async {
    return Get.find<ContractService>().tokenContract!.signContractCall(
      accountInfo.priKey,
      'transfer', [
        EthereumAddress.fromHex(toAddress),
        BigInt.parse(amount.original.toString()),
      ]).then((signedRawTx) {
        return Get.find<ApiProvider>().transferPoint(address, accountInfo.pubKey, signedRawTx).then(
          (res) => res.map((response) => response.statusCode == 200).orElse(false),
        );
      });
  }

  Map<String, dynamic> toJson() {
    return serializers.serialize(this) as Map<String, dynamic>;
  }

  factory DecentralizedIdentity.fromJson(dynamic serialized) {
    return serializers.deserialize(
      serialized,
      specifiedType: const FullType(DecentralizedIdentity),
    ) as DecentralizedIdentity;
  }

  DecentralizedIdentity._();
}
