import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:get/get.dart';

import 'package:bt_wallet/common/application.dart';
import 'package:bt_wallet/common/theme/color.dart';
import 'package:bt_wallet/common/theme/font.dart';
import 'package:bt_wallet/common/theme/index.dart';
import 'package:bt_wallet/models/identity/decentralized_identity.dart';
import 'package:bt_wallet/router/routers.dart';
import 'package:bt_wallet/store/identity_store.dart';
import 'package:bt_wallet/widgets/avatar.dart';
import 'package:bt_wallet/widgets/hint_dialog.dart';

class IdentityPage extends StatefulWidget {
  const IdentityPage({super.key});

  @override
  State<StatefulWidget> createState() => _IdentityPageState();
}

class _IdentityPageState extends State<IdentityPage> {
  final IdentityStore _store = Get.find<IdentityStore>();

  Widget _listItem(DecentralizedIdentity identity) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: GestureDetector(
        onTap: () {
          Application.router.navigateTo(
            context, '${Routes.identityDetail}?id=${identity.id}');
        },
        child: Container(
          padding: const EdgeInsets.all(24),
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
          child: Column(children: <Widget>[
            Row(children: <Widget>[
              const AvatarWidget(width: 32),
              Expanded(child: Container(
                margin: const EdgeInsets.only(left: 12),
                child: Text(
                  identity.profileInfo.name,
                  style: WalletFont.font_18(),
                ),
              ))
            ]),
            Container(
              margin: const EdgeInsets.only(top: 16, bottom: 16),
              height: 1,
              color: WalletColor.middleGrey,
            ),
            GestureDetector(
              onLongPress: () async {
                return Clipboard.setData(ClipboardData(text: identity.did.toString()))
                  .then((_) => showDialogSimple(DialogType.none, '复制成功'));
              },
              child: Text(
                identity.did.toString(),
                style: WalletFont.font_12(
                  textStyle: TextStyle(color: WalletColor.grey),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Center(child: Text(
              '身份',
              style: WalletFont.font_18(textStyle: TextStyle(color: WalletColor.white)),
            )),
          ],
        ),
        // TextField(
        //   controller: _filter,
        //   onChanged: (String value) => _store.updateSearchName(value),
        //   decoration: InputDecoration(prefixIcon: Icon(Icons.search), hintText: 'Search...'),
        // ),
      ],
    );
  }

  Widget buildNewIdentityCard() {
    if (_store.identitiesWithoutDapp.isEmpty) {
      return Container(
        margin: const EdgeInsets.only(bottom: 24),
        padding:
            const EdgeInsets.only(top: 68, bottom: 78, left: 84, right: 84),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
                color: Color(0x0f000000), offset: Offset(0, 4), blurRadius: 12)
          ],
          color: WalletColor.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Image(image: AssetImage('assets/images/id-card.png')),
            Container(
              margin: const EdgeInsets.only(top: 56),
              child: WalletTheme.button(
                  text: '新增身份',
                  onPressed: () => Application.router
                      .navigateTo(context, Routes.newIdentity)),
            )
          ],
        ),
      );
    }

    return Container(
        margin: const EdgeInsets.only(bottom: 24),
        padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
                color: Color(0x0f000000), offset: Offset(0, 4), blurRadius: 12)
          ],
          color: WalletColor.white,
        ),
        child: WalletTheme.button(
            text: '新增身份',
            onPressed: () =>
                Application.router.navigateTo(context, Routes.newIdentity)));
    // onPressed: () => DAppService.signTransaction('id', 'param')));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: WalletColor.primary,
          image: const DecorationImage(
              image: AssetImage('assets/images/background.png'),
              alignment: Alignment.bottomCenter),
        ),
        child: Column(children: <Widget>[
          Container(padding: const EdgeInsets.all(10), child: buildHeader()),
          Expanded(child: Observer(builder: (_) {
            return Container(
                padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
                child: ListView(
                  children: _store.identitiesWithoutDapp
                      .where((identity) =>
                          identity.profileInfo.name.contains(_store.searchName))
                      .map((identity) => _listItem(identity))
                      .toList()
                        ..add(buildNewIdentityCard()),
                ));
          }))
        ]));
  }
}
