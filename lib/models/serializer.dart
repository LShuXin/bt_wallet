import 'package:built_collection/built_collection.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'package:bt_wallet_flutter_01/models/amount.dart';
import 'package:bt_wallet_flutter_01/models/api_response.dart';
import 'package:bt_wallet_flutter_01/models/contract.dart';
import 'package:bt_wallet_flutter_01/models/dcep/dcep.dart';
import 'package:bt_wallet_flutter_01/models/identity/account_info.dart';
import 'package:bt_wallet_flutter_01/models/identity/decentralized_identity.dart';
import 'package:bt_wallet_flutter_01/models/identity/health_info.dart';
import 'package:bt_wallet_flutter_01/models/identity/profile_info.dart';
import 'package:bt_wallet_flutter_01/models/issuer_response.dart';
import 'package:bt_wallet_flutter_01/models/offline_tx/offline_tx.dart';
import 'package:bt_wallet_flutter_01/models/send_transaction_response.dart';
import 'package:bt_wallet_flutter_01/models/transaction.dart';
import 'package:bt_wallet_flutter_01/models/tw_balance.dart';
import 'package:bt_wallet_flutter_01/models/tx_status.dart';
import 'package:bt_wallet_flutter_01/models/vc_type_response.dart';
import 'package:bt_wallet_flutter_01/models/webview/create_account_param.dart';
import 'package:bt_wallet_flutter_01/models/webview/pincode_dialog/pincode_dialog_close.dart';
import 'package:bt_wallet_flutter_01/models/webview/pincode_dialog/pincode_dialog_error_msg.dart';
import 'package:bt_wallet_flutter_01/models/webview/pincode_dialog/pincode_dialog_hint.dart';
import 'package:bt_wallet_flutter_01/models/webview/pincode_dialog/pincode_dialog_input.dart';
import 'package:bt_wallet_flutter_01/models/webview/pincode_dialog/pincode_dialog_style.dart';
import 'package:bt_wallet_flutter_01/models/webview/pincode_dialog/pincode_dialog_title.dart';
import 'package:bt_wallet_flutter_01/models/webview/send_transaction_request.dart';
import 'package:bt_wallet_flutter_01/models/webview/sign_transaction/parameter.dart';
import 'package:bt_wallet_flutter_01/models/webview/sign_transaction/sign_transaction.dart';
import 'package:bt_wallet_flutter_01/models/webview/sign_transaction/transaction_info.dart';
import 'package:bt_wallet_flutter_01/models/webview/webview_request.dart';
import 'package:bt_wallet_flutter_01/models/webview/webview_request_method.dart';
import 'package:bt_wallet_flutter_01/views/ble_payment/common/command.dart';

part 'serializer.g.dart';

@SerializersFor([
  ApiResponse,
  Contract,
  DecentralizedIdentity,
  AccountInfo,
  HealthInfo,
  ProfileInfo,
  Transaction,
  TwBalance,
  TxStatus,
  WebviewRequest,
  WebviewRequestMethod,
  WebviewParameter,
  WebviewParameterType,
  WebviewTransactionInfo,
  WebviewSignTransaction,
  WebviewPincodeDialogStyle,
  WebviewPincodeDialogClose,
  WebviewPincodeDialogErrorMsg,
  WebviewPincodeDialogHint,
  WebviewPincodeDialogInput,
  WebviewPincodeDialogTitle,
  CreateAccountParam,
  Command,
  CommandType,
  Dcep,
  DcepType,
  TxReceive,
  TxSend,
  SendTransactionRequest,
  SendTransactionResponse,
  IssuerResponse,
  VcType,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(AmountSerializer())
      ..add(Iso8601DateTimeSerializer())
      ..addBuilderFactory(const FullType(Dcep), () => DcepBuilder())
      ..addBuilderFactory(const FullType(TxReceive), () => TxReceiveBuilder())
      ..addBuilderFactory(const FullType(TxSend), () => TxSendBuilder())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Dcep)]),
          () => ListBuilder<Dcep>())
      ..addBuilderFactory(const FullType(Command), () => CommandBuilder())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Transaction)]),
          () => ListBuilder<Transaction>())
      ..addBuilderFactory(const FullType(ApiResponse, [FullType(Contract)]),
          () => ApiResponseBuilder<Contract>())
      ..addBuilderFactory(const FullType(ApiResponse, [FullType(Dcep)]),
          () => ApiResponseBuilder<Dcep>())
      ..addBuilderFactory(
          const FullType(ApiResponse, [FullType(SendTransactionResponse)]),
          () => ApiResponseBuilder<SendTransactionResponse>())
      ..addBuilderFactory(
          const FullType(ApiResponse, [
            FullType(BuiltList, [FullType(Dcep)])
          ]),
          () => ApiResponseBuilder<BuiltList<Dcep>>())
      ..addBuilderFactory(const FullType(ApiResponse, [FullType(Transaction)]),
          () => ApiResponseBuilder<Transaction>())
      ..addBuilderFactory(
          const FullType(ApiResponse, [
            FullType(BuiltList, [FullType(Transaction)])
          ]),
          () => ApiResponseBuilder<BuiltList<Transaction>>())
      ..addBuilderFactory(const FullType(ApiResponse, [FullType(TwBalance)]),
          () => ApiResponseBuilder<TwBalance>())
      ..addBuilderFactory(
          const FullType(WebviewRequest), () => WebviewRequestBuilder())
      ..addBuilderFactory(
          const FullType(WebviewParameter, [FullType(WebviewParameterType)]),
          () => WebviewParameterBuilder())
      ..addBuilderFactory(
          const FullType(WebviewTransactionInfo,
              [FullType(BuiltList), FullType(WebviewParameter)]),
          () => WebviewTransactionInfoBuilder())
      ..addBuilderFactory(
          const FullType(
            WebviewSignTransaction,
            [
              FullType(WebviewTransactionInfo),
              FullType(WebviewPincodeDialogStyle),
            ],
          ),
          () => WebviewSignTransactionBuilder)
      ..addBuilderFactory(
          const FullType(
            WebviewPincodeDialogStyle,
            [
              FullType(WebviewPincodeDialogClose),
              FullType(WebviewPincodeDialogErrorMsg),
              FullType(WebviewPincodeDialogHint),
              FullType(WebviewPincodeDialogInput),
              FullType(WebviewPincodeDialogTitle)
            ],
          ),
          () => WebviewPincodeDialogStyleBuilder)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(IssuerResponse)]),
          () => ListBuilder<IssuerResponse>())
      ..addBuilderFactory(
          const FullType(ApiResponse, [FullType(IssuerResponse)]),
          () => ApiResponseBuilder<IssuerResponse>())
      ..addBuilderFactory(
          const FullType(ApiResponse, [
            FullType(BuiltList, [FullType(IssuerResponse)])
          ]),
          () => ApiResponseBuilder<BuiltList<IssuerResponse>>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(VcType)]),
          () => ListBuilder<VcType>())
      ..addBuilderFactory(const FullType(ApiResponse, [FullType(VcType)]),
          () => ApiResponseBuilder<VcType>())
      ..addBuilderFactory(
          const FullType(ApiResponse, [
            FullType(BuiltList, [FullType(VcType)])
          ]),
          () => ApiResponseBuilder<BuiltList<VcType>>()))
    .build();
