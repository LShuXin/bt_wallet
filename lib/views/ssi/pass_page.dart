import 'package:corsac_jwt/corsac_jwt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bt_wallet_flutter_01/models/vc_pass.dart';
import 'package:bt_wallet_flutter_01/store/vc_store.dart';
import 'package:bt_wallet_flutter_01/widgets/error_row.dart';
import 'package:bt_wallet_flutter_01/widgets/header.dart';
import 'package:bt_wallet_flutter_01/widgets/layouts/common_layout.dart';
import 'package:bt_wallet_flutter_01/widgets/qr_card.dart';

class PassPage extends StatelessWidget {
  PassPage();

  final VcStore _store = Get.find();

  VcPass get vcPass => _store.vcPass;

  @override
  Widget build(BuildContext context) {
    final JWT jwt = JWT.parse(vcPass.token);
    try {
      final exp = jwt.getClaim("exp") as int;
      return CommonLayout(
          child: Column(children: <Widget>[
        Header(title: "请出示用于\n【${vcPass.name}】"),
        QrCard(
            data: vcPass.token,
            before: DateTime.fromMillisecondsSinceEpoch(exp * 1000))
      ]));
    } catch (e) {
      return ErrorRowWidget(errorText: "$e");
    }
  }
}
