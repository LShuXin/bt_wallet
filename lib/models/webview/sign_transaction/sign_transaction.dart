import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:bt_wallet_flutter_01/models/serializer.dart';
import 'package:bt_wallet_flutter_01/models/webview/pincode_dialog/pincode_dialog_style.dart';
import 'package:bt_wallet_flutter_01/models/webview/sign_transaction/transaction_info.dart';

part 'sign_transaction.g.dart';

abstract class WebviewSignTransaction
    implements Built<WebviewSignTransaction, WebviewSignTransactionBuilder> {
  static Serializer<WebviewSignTransaction> get serializer =>
      _$webviewSignTransactionSerializer;

  WebviewTransactionInfo get transactionInfo;
  String? get token;
  WebviewPincodeDialogStyle get pincodeDialogStyle;

  static WebviewSignTransaction fromJson(dynamic serialized) {
    try {
      return serializers.deserialize(serialized,
              specifiedType: const FullType(WebviewSignTransaction))
          as WebviewSignTransaction;
    } catch (error) {
      throw Exception('webview sign transaction deserialize error, $error');
    }
  }

  factory WebviewSignTransaction(
          [Function(WebviewSignTransactionBuilder) updates]) =
      _$WebviewSignTransaction;
  WebviewSignTransaction._();
}
