import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:bt_wallet_flutter_01/common/http/http_client.dart';
import 'package:bt_wallet_flutter_01/common/http/loading_interceptor.dart';
import 'package:bt_wallet_flutter_01/common/secure_storage.dart';

import 'package:bt_wallet_flutter_01/service/api_provider.dart';
import 'package:bt_wallet_flutter_01/service/contract_service.dart';
import 'package:bt_wallet_flutter_01/common/util/progress_dialog.dart';

import 'package:bt_wallet_flutter_01/store/dcep_store.dart';
import 'package:bt_wallet_flutter_01/store/identity_store.dart';
import 'package:bt_wallet_flutter_01/store/mnemonics.dart';
import 'package:bt_wallet_flutter_01/views/ble_payment/common/tx_store.dart';

Future<void> initGlobalDependencies() async {
  Get.put(SecureStorage());
  Get.put(ProgressDialog());
  Get.put(LoadingInterceptor());
  Get.put(LogInterceptor(requestBody: true, responseBody: true));
  Get.put(HttpClient());
  Get.put(ApiProvider());
  await Get.putAsync(MnemonicsStore.init);
  await Get.putAsync(ContractService.init);
  await Get.putAsync(IdentityStore.init);
  Get.put(DcepStore());
  await Get.putAsync(OfflineTxStore.init);
}
