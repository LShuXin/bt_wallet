import 'dart:async';
import 'dart:convert';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bt_wallet/common/dapp_list.dart';
import 'package:bt_wallet/common/device_info.dart';
import 'package:bt_wallet/common/theme/color.dart';
import 'package:bt_wallet/models/webview/webview_request.dart';
import 'package:bt_wallet/service/dapp.dart';

class DAppPage extends StatefulWidget {
  final String id;

  const DAppPage({super.key, required this.id});

  @override
  State<StatefulWidget> createState() {
    return DAppPageState();
  }
}

class DAppPageState extends State<DAppPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isLoadingPage = true;
  Color backgroundColor = Colors.white;

  @override
  void initState() {
    super.initState();
    DAppService.dappPageStateInstance = this;
    DAppService.setStatusBarMode('id', 'dark');
  }

  DAppInfo getDappById(String id) {
    return dappList.firstWhere((dapp) => dapp.id == id);
  }

  JavascriptChannel _nativeJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'BTWalletNative',
      onMessageReceived: (JavascriptMessage message) {
        try {
          final Map<String, dynamic> requestJson =
              jsonDecode(message.message) as Map<String, dynamic>;
          final WebviewRequest webViewRequest =
              WebviewRequest.fromJson(requestJson);
          DAppService.getOperator(webViewRequest.method)
              .call(webViewRequest.id, webViewRequest.param ?? '');
        } catch (e) {
          _controller.future.then(
            (webviewController) => webviewController.runJavaScript(
              'window.TWallet.rejectPromise(${json.encode(json.encode(e.toString()))});',
            ),
          );
        }
      },
    );
  }

  Future<bool> onBack() async {
    if (!_controller.isCompleted) {
      resetToAppStatusBar();
      return true;
    }
    final webViewController = await _controller.future;
    webViewController.runJavaScript('window.TWallet.emit("BACK");');
    return false;
  }

  void finishLoading() {
    setState(() {
      isLoadingPage = false;
    });
  }

  void changeBackgroundColor(Color color) {
    setState(() {
      backgroundColor = color;
    });
  }

  void resetToAppStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: WalletColor.primary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBack,
      child: Scaffold(
        backgroundColor: backgroundColor,
        bottomNavigationBar: Theme(
          data: Theme.of(context),
          child: Container(
            height: DeviceInfo.isIphoneXSeries() ? 34 : 0,
            color: WalletColor.white,
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Builder(
                builder: (BuildContext context) {
                  return Container();
                  // return WebViewWidget(
                  //   initialUrl: getDappById(widget.id).url,
                  //   javascriptMode: JavascriptMode.unrestricted,
                  //   onWebViewCreated: (WebViewController webViewController) {
                  //     _controller.complete(webViewController);
                  //     DAppService.webviewController = webViewController;
                  //     DAppService.dappid = widget.id;
                  //   },
                  //   javascriptChannels: <JavascriptChannel>{
                  //     _nativeJavascriptChannel(context),
                  //   },
                  //   onPageStarted: (String url) {
                  //     _controller.future.then((webViewController) {
                  //       webViewController.evaluateJavascript(
                  //         'window._wallet_dapp_id = ${json.encode(widget.id)}',
                  //       );
                  //     });
                  //   },
                  //   onPageFinished: (String url) {
                  //     finishLoading();
                  //     // _controller.future.then((webViewController) {
                  //     //   webViewController.evaluateJavascript(
                  //     //       'document.body.style.overflow = "hidden";');
                  //     // });
                  //   },
                  //   gestureNavigationEnabled: true,
                  //   controller: null,
                  // );
                },
              ),
              if (isLoadingPage)
                Container(
                  alignment: FractionalOffset.center,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      WalletColor.primary,
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
