import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:decimal/decimal.dart';
import 'package:get/get.dart';

import 'package:bt_wallet/common/application.dart';
import 'package:bt_wallet/models/amount.dart';
import 'package:bt_wallet/models/tx_status.dart';
import 'package:bt_wallet/router/routers.dart';
import 'package:bt_wallet/store/identity_store.dart';
import 'package:bt_wallet/modules/transfer/widgets/confirm_row.dart';
import 'package:bt_wallet/modules/transfer/widgets/input_pin.dart';
import 'package:bt_wallet/modules/tx_list/pages/tx_list_details_page.dart';
import 'package:bt_wallet/common/util/date.dart';
import 'package:bt_wallet/widgets/layouts/common_layout.dart';

class TransferConfirmPage extends StatefulWidget {
  final String currency;
  final String amount;
  final String toAddress;

  const TransferConfirmPage({
    super.key,
    required this.currency,
    required this.amount,
    required this.toAddress
  });

  @override
  State<StatefulWidget> createState() => TransferConfirmState();
}

class TransferConfirmState extends State<TransferConfirmPage> {
  final GlobalKey<InputPinWidgetState> _inputPinWidgetKey = GlobalKey<InputPinWidgetState>();
  final IdentityStore _identityStore = Get.find<IdentityStore>();

  TransferConfirmState();

  Future<Object?> _handleConfirm() async {
    final bool pinValidation = await _inputPinWidgetKey.currentState!.validatePin();
    if (pinValidation) {
      final bool transferSuccess = await _identityStore.selectedIdentity.value.transferPoint(
        toAddress: widget.toAddress,
        amount: Amount(Decimal.parse(widget.amount.toString())),
      );
      if (transferSuccess && mounted) {
        return Navigator.pushNamed(
          context,
          Routes.txListDetails,
          arguments: TxListDetailsPageArgs(
            amount: '${Application.globalEnv.tokenSymbol}${widget.amount}',
            time: parseDate(DateTime.now()),
            status: TxStatus.transferring,
            fromAddress: _identityStore.selectedIdentity.value.address,
            toAddress: widget.toAddress,
            fromAddressName: _identityStore.selectedIdentityName,
            isExpense: true,
          ),
        );
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      title: '确认转出',
      withBottomBtn: true,
      btnText: '确认转出',
      btnOnPressed: _handleConfirm,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ConfirmRowWidget(
              title: '金额',
              contentLeft: '${Application.globalEnv.tokenSymbol}${widget.amount}',
              contentRight: widget.currency,
            ),
            ConfirmRowWidget(
              title: '接收地址',
              contentLeft: widget.toAddress,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InputPinWidget(key: _inputPinWidgetKey),
            )
          ],
        ),
      ),
    );
  }
}
