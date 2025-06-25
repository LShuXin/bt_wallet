import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:bt_wallet/common/theme/color.dart';
import 'package:bt_wallet/common/theme/font.dart';
import 'package:bt_wallet/modules/home/home/store/home_store.dart';
import 'package:bt_wallet/widgets/header.dart';

class DiscoveryPage extends StatelessWidget {
  final HomeStore homeStore;

  const DiscoveryPage(this.homeStore, {super.key});

  static TextStyle headerTextStyle =
    WalletFont.font_18(textStyle: TextStyle(color: WalletColor.white));

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Header(title: "发现", height: 138, textStyle: headerTextStyle),
            Expanded(
              child: Container(
                color: WalletColor.backgroundWhite,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          margin: const EdgeInsets.only(top: 68),
        ),
      ],
    );
  }
}
