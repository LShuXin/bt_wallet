import 'package:bip39/bip39.dart' as bip39;
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:tuple/tuple.dart';

import 'package:bt_wallet_flutter_01/common/secure_storage.dart';
import 'package:bt_wallet_flutter_01/service/blockchain_service.dart';

part 'mnemonics.g.dart';

typedef GenerateKeysCallback = Future<dynamic> Function(int index, Tuple2<String, String> keys);

const saveSplitTag = '|';

const identityStartIndex = 1;

class MnemonicsStore extends MnemonicsBase with _$MnemonicsStore {
  late Tuple2<String, String> indexZeroKeys;

  MnemonicsStore(Tuple2<int, String> value) : super(value) {
    generateIndexZeroKeys(value.item2);
  }

  String get firstPublicKey => indexZeroKeys.item1;

  String get firstPrivateKey => indexZeroKeys.item2;

  void generateIndexZeroKeys(String mnemonics) {
    indexZeroKeys = BlockChainService.generateKeys(
      BlockChainService.generateHDWallet(mnemonics),
    );
  }

  Tuple3<int, String, String> peekKeys() {
    final int nextIndex = index + 1;
    final keyPair = BlockChainService.generateKeys(
      BlockChainService.generateHDWallet(mnemonics),
      nextIndex,
    );
    return Tuple3(nextIndex, keyPair.item1, keyPair.item2);
  }

  Tuple2<String, String> indexKeys(int index) {
    return BlockChainService.generateKeys(
      BlockChainService.generateHDWallet(mnemonics),
      index,
    );
  }

  Future<dynamic> generateKeys(GenerateKeysCallback callBack) async {
    return Future.value(
      BlockChainService.generateKeys(
        BlockChainService.generateHDWallet(mnemonics),
        ++index,
      ),
    ).then((keys) => callBack(index, keys)).then((res) {
      return save().then((_) => res);
    });
  }

  void brandNew({String? mnemonics}) {
    // the index 0 is used to call save identities contract
    value = Tuple2(identityStartIndex, mnemonics ?? bip39.generateMnemonic());
    generateIndexZeroKeys(value.item2);
  }

  static Future<MnemonicsStore> init() async {
    Tuple2<int, String> value;
    final SecureStorage secureStorage = Get.find<SecureStorage>();
    final String? saved = await secureStorage.get(SecureStorageItem.mnemonics);

    if (null != saved) {
      final List<String> splits = saved.split(saveSplitTag);
      //兼容老版本
      if (splits.length == 1) {
        value = Tuple2(identityStartIndex, saved);
      } else {
        value = Tuple2(int.parse(splits.first), splits.last);
      }
    } else {
      value = Tuple2(identityStartIndex, bip39.generateMnemonic());
    }

    return MnemonicsStore(value);
  }
}

abstract class MnemonicsBase with Store {
  MnemonicsBase(this.value);

  /// (index, mnemonic)
  @observable
  Tuple2<int, String> value;

  @computed
  int get index => value.item1;

  set index(int newIndex) => value = Tuple2(newIndex, value.item2);

  @computed
  String get mnemonics => value.item2;

  @action
  Future<void> save({int newIndex = 0}) async {
    value = Tuple2(newIndex, value.item2);
    final SecureStorage secureStorage = Get.find<SecureStorage>();
    await secureStorage.set(
      SecureStorageItem.mnemonics,
      '$index$saveSplitTag$mnemonics',
    );
  }
}
