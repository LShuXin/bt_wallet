import 'package:flutter/material.dart';

import 'package:decimal/decimal.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

import 'package:bt_wallet_flutter_01/common/application.dart';
import 'package:bt_wallet_flutter_01/common/device_info.dart';
import 'package:bt_wallet_flutter_01/common/theme/color.dart';
import 'package:bt_wallet_flutter_01/common/theme/font.dart';
import 'package:bt_wallet_flutter_01/common/theme/index.dart';
import 'package:bt_wallet_flutter_01/models/amount.dart';
import 'package:bt_wallet_flutter_01/models/transaction.dart';
import 'package:bt_wallet_flutter_01/router/routers.dart';
import 'package:bt_wallet_flutter_01/store/identity_store.dart';
import 'package:bt_wallet_flutter_01/views/tx_list/store/tx_list_store.dart';
import 'package:bt_wallet_flutter_01/views/tx_list/tx_list_details_page.dart';
import 'package:bt_wallet_flutter_01/views/tx_list/utils/date.dart';
import 'package:bt_wallet_flutter_01/views/tx_list/widgets/tx_list_item.dart';
import 'package:bt_wallet_flutter_01/widgets/layouts/common_layout.dart';

class TxListPage extends StatefulWidget {
  const TxListPage({super.key});

  @override
  State createState() => _TxListPageState();
}

class _TxListPageState extends State<TxListPage> {
  final TxListStore store = TxListStore();
  final IdentityStore iStore = Get.find();

  void _onTap(Transaction item) {
    final ie = _txType(item.fromAddress) == TxType.expense;
    Navigator.pushNamed(
      context,
      Routes.txListDetails,
      arguments: TxListDetailsPageArgs(
        amount: item.amount.value.toString(),
        time: parseDateTime(item.createTime),
        status: item.txType,
        fromAddress: item.fromAddress,
        toAddress: item.toAddress,
        fromAddressName: iStore.selectedIdentityName,
        isExpense: ie,
      ),
    );
  }

  @override
  void initState() {
    store.fetchList(iStore.selectedIdentityAddress);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      title: 'DC/EP',
      child: Observer(
        builder: (context) => Column(
          children: <Widget>[buildHeader(), buildBody(), buildFooter()],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      margin: const EdgeInsets.only(top: 34),
      alignment: Alignment.center,
      child: Text(
        iStore.selectedIdentityBalance?.humanReadableWithSymbol ?? '',
        style:
            WalletFont.font_24(textStyle: TextStyle(color: WalletColor.white)),
      ),
    );
  }

  Widget buildBody() {
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
        child: buildListView(),
      ),
    );
  }

  Widget buildFooter() {
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
                arguments: iStore.selectedIdentity.value,
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
    if (fromAddress.toLowerCase() ==
        iStore.selectedIdentityAddress.toLowerCase()) {
      return TxType.expense;
    } else {
      return TxType.credit;
    }
  }

  Widget buildListView() {
    final txList = store.list;

    if (txList.isEmpty) {
      return const Center(child: Text("no content"));
    }

    return ListView.separated(
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
    );
  }

  Amount _amountWithSignal(bool isExpense, Decimal decimal) {
    return isExpense ? Amount(-decimal) : Amount(decimal);
  }
}
