import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:optional/optional.dart';

import 'package:bt_wallet/common/application.dart';
import 'package:bt_wallet/common/http/http_client.dart';
import 'package:bt_wallet/models/api_response.dart';
import 'package:bt_wallet/models/contract.dart';
import 'package:bt_wallet/models/dcep/dcep.dart';
import 'package:bt_wallet/models/issuer_response.dart';
import 'package:bt_wallet/models/transaction.dart';
import 'package:bt_wallet/models/tw_balance.dart';
import 'package:bt_wallet/models/vc_type_response.dart';

class ApiProvider {
  final HttpClient _httpClient = g.Get.find();

  /// Sends a signed DCEP transaction to the server to complete a DCEP transfer.
  Future<void> transferDcepV2(String from, String publicKey, String signedRawTx) {
    return _httpClient.post(
      '/v2/token/transfer',
      {
        'fromAddress': from,
        'fromPublicKey': publicKey,
        'signedTransactionRawData': signedRawTx,
      },
      throwError: true,
    );
  }

  /// Sends a signed DCEP transaction to the server to complete a DCEP transfer.
  Future<Optional<Dcep>> redeemDcepV2(String address, DcepType type) {
    return _httpClient.post(
      '/v2/token/mint',
      {'address': address, 'moneyType': type.toString()},
    ).then(
      (res) => Future.value(
        res.map(
          (response) =>
            ApiResponse.fromJson(response.data, const [FullType(Dcep)]).result
              as Dcep,
        ),
      ),
    );
  }

  Future<Optional<List<Dcep>>> fetchDcepV2(String address) {
    return _httpClient.get('/v2/token?address=$address', loading: false).then(
      (res) => Future.value(
        res.map(
          (response) => ApiResponse.fromJson(response.data, const [
            FullType(BuiltList, [FullType(Dcep)])
          ]).result.toList() as List<Dcep>,
        ),
      ),
    );
  }

  Future<Optional<TwBalance>> fetchPointV1({required String address, bool? withLoading}) async {
    return _httpClient
      .get('/v1/token/$address', loading: withLoading ?? true)
      .then((res) {
        return Future.value(
          res.map(
            (response) => ApiResponse.fromJson(
              response.data,
              const [FullType(TwBalance)],
            ).result as TwBalance,
          ),
        );
      });
  }

  Future<Optional<Contract>> fetchContractAbiV1({required String contractName}) async {
    return _httpClient
      .get('/v1/contracts/$contractName', loading: false, throwError: true)
      .then((res) {
        return Future.value(
          res.map(
            (response) =>
              ApiResponse.fromJson(response.data, const [FullType(Contract)])
                .result as Contract,
          ),
        );
    });
  }

  Future<Optional<Response>> transferPoint(
    String fromAddress,
    String publicKey,
    String signedRawTx,
  ) {
    return _httpClient.post(
      '/v1/token/transfer',
      {
        'fromAddress': fromAddress,
        'fromPublicKey': publicKey,
        'signedTransactionRawData': signedRawTx
      },
    );
  }

  Future<Optional<List<Transaction>>> fetchTxList(String fromAddress) async {
    return _httpClient
      .get('/v1/transactions?from_addr=$fromAddress', throwError: true)
      .then((res) {
        return Future.value(
          res.map(
            (response) => ApiResponse.fromJson(response.data, const [
              FullType(BuiltList, [FullType(Transaction)])
            ]).result.toList() as List<Transaction>,
          ),
        );
      });
  }

  Future<Optional<Transaction>> fetchTxDetails({required String txHash}) async {
    return _httpClient.get('/v1/transactions/$txHash').then((res) {
      return Future.value(
        res.map(
          (response) =>
            ApiResponse.fromJson(response.data, [const FullType(Transaction)])
              .result as Transaction,
        ),
      );
    });
  }

  Future<Optional<Response>> issuePoints(String address) {
    return _httpClient.post('/v1/token/reward', {'address': address, 'amount': 10});
  }

}
