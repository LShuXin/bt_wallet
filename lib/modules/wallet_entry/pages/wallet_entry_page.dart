import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:bt_wallet/common/application.dart';
import 'package:bt_wallet/common/theme/color.dart';
import 'package:bt_wallet/common/theme/font.dart';
import 'package:bt_wallet/router/routers.dart';
import 'package:bt_wallet/widgets/layouts/common_layout.dart';
import 'package:bt_wallet/widgets/page_title.dart';

class WalletEntryPage extends StatelessWidget {
  const WalletEntryPage({super.key});

  Widget _buildBigButton({required String title, bool disabled = false}) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(vertical: 70),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: WalletColor.lightGrey,
      ),
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Text(
              title,
              style: WalletFont.font_24(
                textStyle: TextStyle(
                  color: disabled ? WalletColor.grey : WalletColor.primary,
                ),
              ),
            ),
            Positioned(
              top: -7,
              left: -76,
              child: SvgPicture.asset(
                'assets/icons/new-wallet.svg',
                color: disabled ? WalletColor.grey : WalletColor.primary,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      backIcon: BackIcon.none,
      bodyBackColor: WalletColor.white,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          color: WalletColor.white,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 44),
                child: Text(
                  '您可以',
                  style: WalletFont.font_20(),
                  textAlign: TextAlign.center,
                ),
              ),
              GestureDetector(
                onTap: () => Application.router.navigateTo(context, Routes.createHDWallet),
                child: _buildBigButton(title: '创建钱包'),
              ),
              GestureDetector(
                onTap: () => Application.router.navigateTo(context, Routes.restoreHDWallet),
                child: _buildBigButton(title: '恢复钱包'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
