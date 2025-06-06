import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bt_wallet_flutter_01/service/api_provider.dart';
import 'package:bt_wallet_flutter_01/service/ssi.dart';
import 'package:bt_wallet_flutter_01/widgets/header.dart';
import 'package:bt_wallet_flutter_01/widgets/layouts/common_layout.dart';
import 'package:bt_wallet_flutter_01/widgets/qr_card.dart';

class VerificationScenarioQrPage extends StatelessWidget {
  final String name;

  final ApiProvider _apiProvider = Get.find<ApiProvider>();

  VerificationScenarioQrPage({required this.name});

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      child: Column(
        children: <Widget>[
          Header(title: name),
          QrCard(
              data: _apiProvider.verifiersVcQrPath(SsiService.getSelectDid())),
        ],
      ),
    );
  }
}
