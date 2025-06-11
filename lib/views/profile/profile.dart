import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:bt_wallet_flutter_01/common/theme/color.dart';
import 'package:bt_wallet_flutter_01/models/identity/decentralized_identity.dart';
import 'package:bt_wallet_flutter_01/router/routers.dart';
import 'package:bt_wallet_flutter_01/store/identity_store.dart';
import 'package:bt_wallet_flutter_01/views/profile/widgets/profile_row.dart';
import 'package:bt_wallet_flutter_01/widgets/avatar.dart';
import 'package:bt_wallet_flutter_01/widgets/hint_dialog.dart';
import 'package:bt_wallet_flutter_01/widgets/layouts/common_layout.dart';

class ProfilePage extends StatelessWidget {
  final String id;
  final IdentityStore identityStore = Get.find();

  ProfilePage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final DecentralizedIdentity? identity = identityStore.getIdentityById(id);

    return CommonLayout(
      title: '个人信息',
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 40),
            alignment: Alignment.center,
            child: const AvatarWidget(),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                color: WalletColor.white,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ListView(
                children: <Widget>[
                  ProfileRowWidget(
                    assetIcon: 'assets/icons/name.svg',
                    name: '名称*',
                    value: identity?.profileInfo.name,
                  ),
                  ProfileRowWidget(
                    assetIcon: 'assets/icons/email.svg',
                    name: '邮箱',
                    value: identity?.profileInfo.email,
                  ),
                  ProfileRowWidget(
                    assetIcon: 'assets/icons/phone.svg',
                    name: '电话',
                    value: identity?.profileInfo.phone,
                  ),
                  ProfileRowWidget(
                    assetIcon: 'assets/icons/birth.svg',
                    name: '生日',
                    value: identity?.profileInfo.birthday ?? '',
                  ),
                  GestureDetector(
                    onLongPress: () async {
                      return Clipboard.setData(
                        ClipboardData(text: identity?.did.toString() ?? ''),
                      ).then((_) => showDialogSimple(DialogType.none, '复制成功'));
                    },
                    child: ProfileRowWidget(
                      assetIcon: 'assets/icons/eye.svg',
                      name: 'DID',
                      value: identity?.did.toString(),
                    ),
                  ),
                  ProfileRowWidget(
                    assetIcon: 'assets/icons/qrcode.svg',
                    name: '二维码名片',
                    value: _buildQR(context, identity),
                    withoutBottomBorder: true,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQR(BuildContext context, DecentralizedIdentity? id) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.pushNamed(context, Routes.qrPage, arguments: id),
      child: Container(
        padding: const EdgeInsets.only(bottom: 8, top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SvgPicture.asset(
              'assets/icons/right-arrow.svg',
              color: WalletColor.grey,
            )
          ],
        ),
      ),
    );
  }
}
