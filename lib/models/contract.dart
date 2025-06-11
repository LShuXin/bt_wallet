import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:bt_wallet_flutter_01/models/serializer.dart';

part 'contract.g.dart';

abstract class Contract extends Object implements Built<Contract, ContractBuilder> {
  static Serializer<Contract> get serializer => _$contractSerializer;

  /// The display name of the contract, typically used to identify the token or smart contract (e.g., “USDT” or “My NFT Contract”).
  String get name;

  /// The contract address where the contract is deployed. This is a unique identifier on the chain (e.g., 0x123...).
  String get address;

  /// The ABI (Application Binary Interface) of the contract, represented as a JSON string. It defines how to interact with the contract's functions.
  String get abi;

  /// The shorthand symbol for the token, often used in wallets or UIs (e.g., "ETH", "DAI").
  String? get symbol;

  /// The number of decimal places used by the token. It defines how balances are displayed (e.g., 18 for ETH-based tokens).
  int? get decimal;

  Map<String, dynamic> toJson() => serializers.serialize(this) as Map<String, dynamic>;

  factory Contract([void Function(ContractBuilder) updates]) = _$Contract;

  factory Contract.fromJson(dynamic serialized)
    => serializers.deserialize(serialized, specifiedType: const FullType(Contract)) as Contract;

  Contract._();
}
