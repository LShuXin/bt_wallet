import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:bt_wallet/common/device_info.dart';
import 'package:bt_wallet/common/secure_storage.dart';
import 'package:bt_wallet/common/theme/color.dart';
import 'package:bt_wallet/router/routers.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WalletColor.white,
      body: Center(child: Image.asset('assets/images/t-wallet.png')),
    );
  }

  Future<void> _init() async {
    final route = await _getInitialRoute();
    await Future.delayed(Duration(seconds: 2));
    if (mounted) {
      Navigator.of(context).popAndPushNamed(route);
    }
  }

  Future<String> _getInitialRoute() async {
    await DeviceInfo.initialDeviceInfo();
    if (await Get.find<SecureStorage>().hasMnemonics()) {
      return Routes.home;
    } else {
      return Routes.inputPin;
    }
  }

}
