import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:decimal/decimal.dart';
import 'package:get/get.dart';
import 'package:optional/optional.dart';
import 'package:web3dart/credentials.dart';

import 'package:bt_wallet/common/theme/color.dart';
import 'package:bt_wallet/common/theme/font.dart';
import 'package:bt_wallet/common/theme/index.dart';
import 'package:bt_wallet/models/amount.dart';
import 'package:bt_wallet/models/did.dart';
import 'package:bt_wallet/models/tx_status.dart';
import 'package:bt_wallet/router/routers.dart';
import 'package:bt_wallet/store/identity_store.dart';
import 'package:bt_wallet/modules/tx_list/widgets/color_money_text.dart';
import 'package:bt_wallet/modules/tx_list/widgets/tx_info_card.dart';
import 'package:bt_wallet/widgets/layouts/common_layout.dart';
import 'package:bt_wallet/widgets/page_title.dart';

class TxListDetailsPageArgs {
  final String amount;
  final String time;
  final TxStatus status;
  final String fromAddress;
  final String fromAddressName;
  final String toAddress;
  final bool isExpense;
  final bool shouldBackToHome;

  TxListDetailsPageArgs({
    required this.amount,
    required this.fromAddressName,
    required this.isExpense,
    required this.time,
    required this.status,
    required this.fromAddress,
    required this.toAddress,
    this.shouldBackToHome = false,
  });
}

class TxListDetailsPage extends StatelessWidget {
  const TxListDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TxListDetailsPageArgs args =
      ModalRoute.of(context)!.settings.arguments as TxListDetailsPageArgs;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        if (args.shouldBackToHome) {
          return;
        }
        Navigator.of(context).pop();
      },
      child: CommonLayout(
        title: '交易状态',
        backIcon: args.shouldBackToHome ? BackIcon.none : BackIcon.arrow,
        child: _buildMainContent(context, args),
      ),
    );
  }

  Container _buildMainContent(BuildContext context, TxListDetailsPageArgs args) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: ListView(
        children: <Widget>[
          _buildStatusCard(args),
          _buildTXInfoCard(args),
          if (args.shouldBackToHome)
            _buildButton(context, args)
        ],
      ),
    );
  }

  Widget _buildStatusCard(TxListDetailsPageArgs args) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: WalletColor.white,
      ),
      child: Column(
        children: <Widget>[
          ColorMoneyText(
            amount: Amount(
              Decimal.parse(
                args.isExpense ? '-${args.amount}' : args.amount,
              ),
            ),
            status: args.status,
            isExpense: args.isExpense,
            textStyle: WalletFont.font_24(),
          ),
          Container(
            height: 1,
            color: WalletColor.middleGrey,
            margin: const EdgeInsets.only(top: 30, bottom: 24),
          ),
          Text('- ${args.status.toString()} -', style: WalletFont.font_16()),
          Container(
            margin: const EdgeInsets.only(top: 14),
            child: Text(
              args.status.getDesc(),
              style: WalletFont.font_14(),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTXInfoCard(TxListDetailsPageArgs args) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: WalletColor.white,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(right: 30),
                child: Text(
                  '交易时间',
                  style: WalletFont.font_14(
                    textStyle: TextStyle(color: WalletColor.grey),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  args.time,
                  style: WalletFont.font_14(
                    textStyle: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  textAlign: TextAlign.right,
                ),
              )
            ],
          ),
          Container(
            height: 1,
            color: WalletColor.middleGrey,
            margin: const EdgeInsets.symmetric(vertical: 20),
          ),
          TxInfoCardWidget(
            txInfoCardType: TxInfoCardType.sender,
            name: args.isExpense ? args.fromAddressName : null,
            did: DID
                .fromEthAddress(EthereumAddress.fromHex(args.fromAddress))
                .toString(),
          ),
          const SizedBox(height: 20),
          TxInfoCardWidget(
            txInfoCardType: TxInfoCardType.receiver,
            name: args.isExpense ? null : args.fromAddressName,
            did: DID
                .fromEthAddress(EthereumAddress.fromHex(args.toAddress))
                .toString(),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, TxListDetailsPageArgs args) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0f000000),
            offset: Offset(0, 4),
            blurRadius: 12,
          )
        ],
        color: WalletColor.white,
      ),
      child: WalletTheme.button(
        text: '好的',
        onPressed: () {
          Get.find<IdentityStore>().fetchLatestPoint(withLoading: true);
          Navigator.popUntil(
            context,
            (Route<dynamic> route) => Optional.ofNullable(route.settings.name)
              .map((name) => name.startsWith(Routes.home))
              .orElse(false),
          );
        },
      ),
    );
  }
}
