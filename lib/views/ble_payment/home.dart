import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:web3dart/web3dart.dart';

import 'package:bt_wallet_flutter_01/common/theme/color.dart';
import 'package:bt_wallet_flutter_01/common/theme/index.dart';
import 'package:bt_wallet_flutter_01/models/dcep/dcep.dart';
import 'package:bt_wallet_flutter_01/models/identity/decentralized_identity.dart';
import 'package:bt_wallet_flutter_01/models/offline_tx/offline_tx.dart';
import 'package:bt_wallet_flutter_01/service/contract.dart';
import 'package:bt_wallet_flutter_01/store/dcep/dcep_store.dart';
import 'package:bt_wallet_flutter_01/store/identity_store.dart';
import 'package:bt_wallet_flutter_01/views/ble_payment/common/tx_store.dart';
import 'package:bt_wallet_flutter_01/views/ble_payment/payee/payee_confirm.dart';
import 'package:bt_wallet_flutter_01/views/ble_payment/payer/payee_list.dart';
import 'package:bt_wallet_flutter_01/views/home/home.dart';
import 'package:bt_wallet_flutter_01/views/home/home_store.dart';
import 'package:bt_wallet_flutter_01/widgets/hint_dialog.dart';
import 'package:bt_wallet_flutter_01/widgets/layouts/common_layout.dart';

class BlePaymentHome extends StatefulWidget {
  final HomeStore homeStore;

  const BlePaymentHome(this.homeStore);

  @override
  State<StatefulWidget> createState() => _BlePaymentHomeState();
}

class _BlePaymentHomeState extends State<BlePaymentHome> {
  bool isNonceSynced = false;

  final Connectivity _connectivity = Connectivity();
  final Rx<DcepType> _redeemType = Rx(DcepType.rmb100);
  final DcepStore _dcepStore = Get.find<DcepStore>();
  final OfflineTxStore _txStore = Get.find<OfflineTxStore>();

  @override
  void initState() {
    super.initState();
  }

  Widget _buildAddIdentityCard(BuildContext context, HomeStore homeStore) {
    final ScreenUtil _screenUtil = ScreenUtil();

    return Container(
      margin: EdgeInsets.only(
        left: _screenUtil.setWidth(24).toDouble(),
        right: _screenUtil.setWidth(24).toDouble(),
        top: _screenUtil.setHeight(10).toDouble(),
        bottom: _screenUtil.setHeight(147).toDouble(),
      ),
      padding: EdgeInsets.only(
        left: _screenUtil.setWidth(20).toDouble(),
        right: _screenUtil.setWidth(20).toDouble(),
        top: _screenUtil.setHeight(90).toDouble(),
        bottom: _screenUtil.setHeight(46).toDouble(),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SvgPicture.asset(
            'assets/icons/new-identity.svg',
          ),
          Column(
            children: const <Widget>[
              Text(
                "您还没有添加身份",
                style: TextStyle(
                  color: Color(0xff111111),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0,
                ),
              ),
              Text(
                "请前往“身份”页面添加身份。",
                style: TextStyle(
                  color: Color(0xff111111),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0,
                ),
              ),
            ],
          ),
          WalletTheme.button(
            text: '立即前往',
            height: 44,
            onPressed: () {
              Navigator.pop(context);
              homeStore.currentPage = HomeState.identityIndex;
            },
          ),
        ],
      ),
    );
  }

  Widget _dcepListItem(String description) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: WalletColor.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: WalletColor.grey, blurRadius: 12)],
        ),
        child: Center(child: Text(description)),
      ),
    );
  }

  Widget _buildNetworkOffScreen(List<ConnectivityResult>? result) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Icon(
            Icons.network_check,
            size: 200.0,
            color: Colors.white54,
          ),
          Text(
            '网络已关闭，请打开网络同步账户信息',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyLarge
                ?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }

  List<Widget> _dcepListItems(List<Dcep> dcepList, Queue<TxReceive> txList) {
    final items = dcepList.map((item) => item.type.humanReadable).toList()
      ..addAll(txList.map((tx) => '${tx.description}(冻结，待确权)').toList());
    return items.map((item) => _dcepListItem(item)).toList();
  }

  Widget _buildMainScreen(DecentralizedIdentity identity) {
    return Container(
      color: WalletColor.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => DropdownButton(
                    value: _redeemType.value,
                    items: DcepType.values
                        .map(
                          (type) => DropdownMenuItem(
                            value: type,
                            child: Text(type.humanReadable),
                          ),
                        )
                        .toList(),
                    onChanged: (DcepType? value) {
                      if (null != value) {
                        _redeemType.value = value;
                      }
                    },
                  ),
                ),
                WalletTheme.button(
                  text: '兑换',
                  height: 28,
                  onPressed: () => identity.redeemDcep(_redeemType.value).then(
                        (_) => showDialogSimple(DialogType.success, '兑换成功'),
                      ),
                ),
              ],
            ),
            Expanded(
              child: Obx(
                () => Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RefreshIndicator(
                    onRefresh: () => _dcepStore.refresh(),
                    child: ListView(
                      children: _dcepListItems(
                        _dcepStore.sortedItems,
                        _txStore.txQueue.value,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: WalletTheme.button(
                    text: '收款',
                    onPressed: () => Get.to(PayeeConfirm(identity)),
                  ),
                ),
                Container(width: 20),
                Expanded(
                  child: WalletTheme.button(
                    text: '付款',
                    onPressed: () => Get.to(PayeeListPage(identity)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildScreen() {
    if (Get.find<IdentityStore>().selectedIdentity.isPresent) {
      final DecentralizedIdentity identity =
          Get.find<IdentityStore>().selectedIdentity.value;

      return FutureBuilder<List<ConnectivityResult>>(
        future: _connectivity.checkConnectivity(),
        builder: (context, initialSnapshot) {
          // 等待初始连接性结果
          if (initialSnapshot.connectionState != ConnectionState.done) {
            return Container();
          }

          final initialConnectivity = initialSnapshot.data;
          if (initialConnectivity == null) {
            return Container(); // or error widget
          }

          return StreamBuilder<List<ConnectivityResult>>(
            initialData: initialConnectivity,
            stream: _connectivity.onConnectivityChanged,
            builder: (context, connectivitySnapshot) {
              final result = connectivitySnapshot.data;

              if (!isNonceSynced && result == ConnectivityResult.none) {
                return _buildNetworkOffScreen(result);
              }

              if (!isNonceSynced && result != ConnectivityResult.none) {
                return FutureBuilder<int>(
                  future: Get.find<ContractService>()
                      .nftTokenContract
                      ?.getTransactionCount(
                    EthereumAddress.fromHex(identity.address),
                  ),
                  builder: (context, nonceSnapshot) {
                    if (nonceSnapshot.connectionState == ConnectionState.waiting) {
                      return Container(); // or loading widget
                    }

                    final nonce = nonceSnapshot.data;
                    if (nonce != null) {
                      // ⚠️ 在 build 中不建议直接设置状态，推荐用 Future.delayed + setState 或 controller 管理
                      Future.microtask(() {
                        if (!isNonceSynced) {
                          isNonceSynced = true;
                          _dcepStore.nonce = nonce;
                        }
                      });
                      return _buildMainScreen(identity);
                    } else {
                      return Container(); // or error widget
                    }
                  },
                );
              }

              return _buildMainScreen(identity);
            },
          );
        },
      );

    } else {
      return _buildAddIdentityCard(context, widget.homeStore);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      title: '离线支付',
      bottomBackColor: WalletColor.white,
      child: _buildScreen(),
    );
  }
}
