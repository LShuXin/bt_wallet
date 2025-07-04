import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bt_wallet/common/application.dart';
import 'package:bt_wallet/common/theme/color.dart';
import 'package:bt_wallet/router/routers.dart';

import 'hint_dialog.dart';

class ScanIcon extends StatelessWidget {
  const ScanIcon({
    this.onTap,
    this.scanCallBack,
    this.width = 32,
    this.height = 32,
  });

  final double width;
  final double height;
  final GestureTapCallback? onTap;
  final Future<void> Function(String)? scanCallBack;

  static const String _svg = 'assets/icons/scan.svg';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 24, top: 6),
      child: GestureDetector(
        onTap: onTap ?? () => _handleScan(context),
        child: SvgPicture.asset(
          _svg,
          color: WalletColor.white,
          width: width,
          height: height,
        ),
      ),
    );
  }

  Future<void> _handleScan(BuildContext context) async {
    final String scanResult = await Application.router
        .navigateTo(context, Routes.qrScanner) as String;

    if (null == scanResult) {
      return;
    }

    return Future.delayed(const Duration(milliseconds: 500)).then((_) async {
      try {
        await scanCallBack!(scanResult);
      } catch (e) {
        await hintDialogHelper(context, DialogType.warning, e.toString());
      }
    });
  }
}
