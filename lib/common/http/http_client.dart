import 'package:flutter/foundation.dart';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:optional/optional.dart';

import 'package:bt_wallet_flutter_01/common/application.dart';
import 'package:bt_wallet_flutter_01/common/http/loading_interceptor.dart';
import 'package:bt_wallet_flutter_01/widgets/hint_dialog.dart';

void showErrorDialog(DioException err) {
  String errorMessage = '未知错误';
  DialogType hintType = DialogType.error;

  if (err.type == DioExceptionType.connectionTimeout ||
      err.type == DioExceptionType.sendTimeout ||
      err.type == DioExceptionType.receiveTimeout) {
    hintType = DialogType.network;
  }

  switch (err.type) {
    case DioExceptionType.connectionTimeout:
      errorMessage = '连接超时';
      break;

    case DioExceptionType.sendTimeout:
      errorMessage = '发送超时';
      break;

    case DioExceptionType.receiveTimeout:
      errorMessage = '接收超时';
      break;

    case DioExceptionType.cancel:
      errorMessage = '用户取消';
      break;

    default:
      if (err.response != null) {
        if (err.response!.statusCode == 400) {
          if (err.response!.data['code'] == 40000) {
            errorMessage = err.response!.data['msg'] as String;
          } else {
            errorMessage = '请求失败';
          }
        }
        if (err.response!.statusCode! >= 500) {
          errorMessage = '服务端不响应';
        }
      }
      break;
  }
  showDialogSimple(hintType, '$errorMessage，请稍后再试。。。');
}

Dio _initDio() {
  final LoadingInterceptor loadingInterceptor = g.Get.find();
  final LogInterceptor logInterceptor = g.Get.find();
  final Dio dio = Dio()
    ..options = BaseOptions(
      baseUrl: Application.globalEnv.apiGatewayBaseUrl,
      connectTimeout: Duration(milliseconds: Application.globalEnv.apiGatewayConnectTimeout),
    )
    ..interceptors.add(loadingInterceptor);

  if (kDebugMode) {
    dio.interceptors.add(logInterceptor);
  }

  return dio;
}

class HttpClient {
  final Dio _dio = _initDio();

  Future<Optional<Response>> get(String url, {bool loading = true, bool throwError = false}) async {
    return _dio
      .get(url, options: Options(extra: {'withoutLoading': !loading}))
      .then((response) => Optional.of(response))
      .catchError((error) {
        if (throwError) {
          throw Exception(error);
        } else {
          showErrorDialog(error as DioError);
        }
        return const Optional<Response>.empty();
      });
  }

  Future<Optional<Response>> post(String url, Map<String, dynamic> data, {bool loading = true, bool throwError = false}) async {
    return _dio
      .post(
        url,
        data: data,
        options: Options(extra: {'withoutLoading': !loading}),
      )
      .then((response) => Optional.of(response))
      .catchError((error) {
        if (throwError) {
          throw Exception(error);
        } else {
          showErrorDialog(error as DioError);
        }
        return const Optional<Response>.empty();
      });
  }

  Future<Optional<Response>> patch(String url, Map<String, dynamic> data, {bool loading = true, bool throwError = false}) async {
    return _dio
      .patch(
        url,
        data: data,
        options: Options(extra: {'withoutLoading': !loading}),
      )
      .then((response) => Optional.of(response))
      .catchError((error) {
        if (throwError) {
          throw Exception(error);
        } else {
          showErrorDialog(error as DioError);
        }
        return const Optional<Response>.empty();
      });
  }
}
