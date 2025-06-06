import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:bt_wallet_flutter_01/common/application.dart';
import 'package:bt_wallet_flutter_01/common/device_info.dart';
import 'package:bt_wallet_flutter_01/common/getx.dart';
import 'package:bt_wallet_flutter_01/common/secure_storage.dart';
import 'package:bt_wallet_flutter_01/common/theme/color.dart';
import 'package:bt_wallet_flutter_01/router/routers.dart';

class SplashScreen extends StatefulWidget {
  final Function(String) onInitializationComplete;

  const SplashScreen({
    super.key,
    required this.onInitializationComplete,
  });

  @override
  createState() => _SplashAppState();
}

class _SplashAppState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeAsyncDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Scaffold(
      backgroundColor: WalletColor.white,
      body: Center(child: Image.asset('assets/images/t-wallet.png')),
    );
  }

  Future<void> _initializeAsyncDependencies() async {
    print('LSX1');
    Application.appName = (await PackageInfo.fromPlatform()).appName ?? 'test-app';
    print('LSX2');
    await initGlobalDependencies();
    print('LSX3');
    final route = await _initialRoute();
    print('LSX4');
    print(route);
    widget.onInitializationComplete(route);
  }

  Future<String> _initialRoute() async {
    await DeviceInfo.initialDeviceInfo();
    if (await Get.find<SecureStorage>().hasMnemonics()) {
      return Routes.home;
    } else {
      return Routes.inputPin;
    }
  }

}
