import 'package:bt_wallet/modules/ble_payment/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';
import 'package:bt_wallet/common/application.dart';
import 'package:bt_wallet/common/dapp_list.dart';
import 'package:bt_wallet/common/secure_storage.dart';
import 'package:bt_wallet/common/theme/color.dart';
import 'package:bt_wallet/common/theme/font.dart';
import 'package:bt_wallet/router/routers.dart';
import 'package:bt_wallet/common/util/progress_dialog.dart';
import 'package:bt_wallet/store/dcep_store.dart';
import 'package:bt_wallet/store/identity_store.dart';
import 'package:bt_wallet/modules/create_hd_wallet/widgets/tips.dart';
import 'package:bt_wallet/modules/home/home/store/home_store.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:bt_wallet/models/identity/decentralized_identity.dart';

Future<void> _cleanPrivateData(BuildContext context) async {
  final ProgressDialog _dialog = Get.find();
  _dialog.show();
  return Get.find<IdentityStore>()
      .clear()
      .then((_) => Get.find<DcepStore>().clear())
      .then((_) => Get.find<SecureStorage>().clearAll())
      .then((_) => clearAllDappStorage(FlutterWebviewPlugin()))
      .then(
        (_) => Future.delayed(const Duration(seconds: 1)).then((_) {
          _dialog.dismiss();
          Application.router
              .navigateTo(context, Routes.inputPin, clearStack: true);
        }),
      );
}

Future<void> clearAllDappStorage(
    FlutterWebviewPlugin flutterWebviewPlugin) async {
  // ignore: avoid_function_literals_in_foreach_calls
  dappList.forEach((dapp) async {
    await flutterWebviewPlugin.launch(dapp.url, hidden: true);
    await flutterWebviewPlugin.clearCache();
    await flutterWebviewPlugin.close();
  });
}

class MyPage extends StatelessWidget {
  final HomeStore homeStore;

  const MyPage(this.homeStore);

  Widget _buildButton(String text, VoidCallback onTap) {
    final _screenUtil = ScreenUtil();
    ;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: _screenUtil.setWidth(15).toDouble()),
        height: _screenUtil.setWidth(90).toDouble(),
        decoration: BoxDecoration(
          color: WalletColor.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0f000000),
              offset: Offset(0, 4),
              blurRadius: 12,
            )
          ],
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: _screenUtil.setWidth(20).toDouble(),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(text, style: WalletFont.font_18()),
                SvgPicture.asset('assets/icons/right-arrow.svg')
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _screenUtil = ScreenUtil();

    return Column(
      children: <Widget>[
        Container(
          height: _screenUtil.setHeight(244).toDouble(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Text(
              'My Profile',
              style: WalletFont.font_24(
                textStyle: TextStyle(
                  color: WalletColor.white,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: WalletColor.lightGrey,
            child: Padding(
              padding: EdgeInsets.all(_screenUtil.setWidth(24).toDouble()),
              child: ListView(
                children: <Widget>[
                  _buildButton(
                    'Offline Payment', //离线支付
                    () => Get.to(BlePaymentHome(homeStore)),
                  ),
                  _buildButton(
                    'My Chat', //我的聊天
                    () => {
                      Application.router.navigateTo(context, Routes.messagePage)
                    },
                  ),
                  _buildButton('Clear Data', () => _cleanPrivateData(context)),  //清除数据
                  Padding(
                    padding: EdgeInsets.only(
                      top: _screenUtil.setWidth(5).toDouble(),
                    ),
                    child: const Tips('Please be careful, all data would be deleted permanently and cannot be recovered'),  // 将从此设备中删除所有钱包数据且无法恢复，请谨慎操作
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
