import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';

import 'package:bt_wallet/common/theme/color.dart';
import 'package:bt_wallet/common/theme/font.dart';
import 'package:bt_wallet/models/identity/decentralized_identity.dart';
import 'package:bt_wallet/widgets/avatar.dart';
import 'package:bt_wallet/widgets/layouts/common_layout.dart';

class IdentityQRPage extends StatelessWidget {
  const IdentityQRPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DecentralizedIdentity decentralizedIdentity =
      ModalRoute.of(context)!.settings.arguments as DecentralizedIdentity;

    return CommonLayout(
      title: '身份二维码',
      child: _buildMainContent(decentralizedIdentity),
    );
  }

  Widget _buildMainContent(DecentralizedIdentity identity) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  color: WalletColor.white,
                ),
                margin: const EdgeInsets.only(left: 18, right: 18, top: 40),
                padding: const EdgeInsets.only(
                  top: 74,
                  bottom: 41,
                  left: 60,
                  right: 60,
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      identity.profileInfo.name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    _buildQRCode(identity.did.toString()),
                    Container(
                      height: 1,
                      margin: const EdgeInsets.only(top: 60, bottom: 40),
                      color: WalletColor.middleGrey,
                    ),
                    Text(
                      identity.did.toString(),
                      style: WalletFont.font_14(),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const Positioned(
                child: Align(child: AvatarWidget()),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildQRCode(String did) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: QrImageView(
        data: did,
        size: 200.0,
      ),
    );
  }
}
