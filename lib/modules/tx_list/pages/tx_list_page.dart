import 'package:flutter/material.dart';

import 'package:decimal/decimal.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

import 'package:bt_wallet/common/application.dart';
import 'package:bt_wallet/common/device_info.dart';
import 'package:bt_wallet/common/theme/color.dart';
import 'package:bt_wallet/common/theme/font.dart';
import 'package:bt_wallet/common/theme/index.dart';
import 'package:bt_wallet/models/amount.dart';
import 'package:bt_wallet/models/transaction.dart';
import 'package:bt_wallet/router/routers.dart';
import 'package:bt_wallet/store/identity_store.dart';
import 'package:bt_wallet/modules/tx_list/widgets/tx_list_item.dart';
import 'package:bt_wallet/modules/tx_list/store/tx_list_store.dart';
import 'package:bt_wallet/modules/tx_list/pages/tx_list_details_page.dart';
import 'package:bt_wallet/common/util/date.dart';
import 'package:bt_wallet/widgets/layouts/common_layout.dart';

class TxListPage extends StatefulWidget {
  const TxListPage({super.key});

  @override
  State createState() => _TxListPageState();
}

class _TxListPageState extends State<TxListPage> {
  final TxListStore _txListStore = TxListStore();
  final IdentityStore _identityStore = Get.find();

  void _onTap(Transaction item) {
    final isExpense = _txType(item.fromAddress) == TxType.expense;
    Navigator.pushNamed(
      context,
      Routes.txListDetails,
      arguments: TxListDetailsPageArgs(
        amount: item.amount.value.toString(),
        time: parseDateTime(item.createTime),
        status: item.txType,
        fromAddress: item.fromAddress,
        toAddress: item.toAddress,
        fromAddressName: _identityStore.selectedIdentityName,
        isExpense: isExpense,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _txListStore.fetchList(_identityStore.selectedIdentityAddress);
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      title: 'xxx',
      child: Observer(
        builder: (context) => Column(
          children: <Widget>[
            _buildHeader(),
            _buildBody(),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: const EdgeInsets.only(top: 34),
      alignment: Alignment.center,
      child: Text(
        _identityStore.selectedIdentityBalance?.humanReadableWithSymbol ?? '',
        style: WalletFont.font_24(textStyle: TextStyle(color: WalletColor.white)),
      ),
    );
  }

  Widget _buildBody() {
    final txList = _txListStore.list;

    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 34),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          color: WalletColor.white,
        ),
        child: txList.isEmpty
          ? const Center(child: Text("no content"))
          : ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: txList.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                final item = txList[index];
                return TxListItem(
                  _txType(item.fromAddress) == TxType.expense
                    ? item.toAddress
                    : item.fromAddress,
                  item.txType,
                  _amountWithSignal(
                  _txType(item.fromAddress) == TxType.expense,
                  item.amount.value,
                  ),
                  item.createTime,
                  () => _onTap(item),
                  _txType(item.fromAddress),
                );
              },
              separatorBuilder: (BuildContext context, int index) => Divider(
                height: 1,
                color: WalletColor.grey,
              ),
            )
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: DeviceInfo.isIphoneXSeries() ? 34 : 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: WalletTheme.button(
              text: '转账',
              onPressed: () => Application.router
                .navigateTo(context, Routes.transferTwPoints),
              buttonType: ButtonType.outlineType,
              outlineColor: WalletColor.white,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: WalletTheme.button(
              text: '收款',
              onPressed: () => Navigator.pushNamed(
                context,
                Routes.qrPage,
                arguments: _identityStore.selectedIdentity.value,
              ),
              buttonType: ButtonType.outlineType,
              outlineColor: WalletColor.white,
            ),
          )
        ],
      ),
    );
  }

  TxType _txType(String fromAddress) {
    if (fromAddress.toLowerCase() == _identityStore.selectedIdentityAddress.toLowerCase()) {
      return TxType.expense;
    } else {
      return TxType.credit;
    }
  }

  Amount _amountWithSignal(bool isExpense, Decimal decimal) {
    return isExpense ? Amount(-decimal) : Amount(decimal);
  }
}
