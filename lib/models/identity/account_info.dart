import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:bt_wallet_flutter_01/models/amount.dart';
import 'package:bt_wallet_flutter_01/models/serializer.dart';

part 'account_info.g.dart';

abstract class AccountInfo implements Built<AccountInfo, AccountInfoBuilder> {
  static Serializer<AccountInfo> get serializer => _$accountInfoSerializer;

  /// Account index, possibly the HD wallet account number
  int get index;

  /// The public key of the account
  String get pubKey;

  /// The private key (should be handled carefully for security!)
  String get priKey;

  /// Nullable balance object that likely holds value info
  Amount? get balance;

  static AccountInfo fromJson(dynamic serialized) {
    try {
      return serializers.deserialize(
        serialized,
        specifiedType: const FullType(AccountInfo),
      ) as AccountInfo;
    } catch (error) {
      throw Exception('webview request deserialize error, $error');
    }
  }

  factory AccountInfo([Function(AccountInfoBuilder) updates]) = _$AccountInfo;
  AccountInfo._();
}
