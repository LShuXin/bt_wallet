import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:bt_wallet/common/application.dart';
import 'package:bt_wallet/common/theme/color.dart';
import 'package:bt_wallet/common/theme/font.dart';
import 'package:bt_wallet/common/theme/index.dart';
import 'package:bt_wallet/models/amount.dart';
import 'package:bt_wallet/models/did.dart';
import 'package:bt_wallet/models/identity/decentralized_identity.dart';
import 'package:bt_wallet/models/tx_status.dart';
import 'package:bt_wallet/router/routers.dart';
import 'package:bt_wallet/store/identity_store.dart';
import 'package:bt_wallet/modules/transfer/store/transfer_store.dart';
import 'package:bt_wallet/modules/transfer/widgets/transfer_input.dart';
import 'package:bt_wallet/modules/transfer/widgets/input_pin.dart';
import 'package:bt_wallet/modules/tx_list/pages/tx_list_details_page.dart';
import 'package:bt_wallet/common/util/date.dart';
import 'package:bt_wallet/widgets/hint_dialog.dart';
import 'package:bt_wallet/widgets/layouts/common_layout.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<StatefulWidget> createState() => TransferPageState();
}

class TransferPageState extends State<TransferPage> {
  final GlobalKey<InputPinWidgetState> _inputPinWidgetKey = GlobalKey<InputPinWidgetState>();
  final TransferStore _transferStore = TransferStore();
  final IdentityStore _iStore = Get.find();
  final TextEditingController _payeeAddressController = TextEditingController();
  YYDialog? _confirmDialogInstance;
  late DecentralizedIdentity _dIdentity;

  @override
  void initState() {
    super.initState();
    _transferStore.setupErrorDisposers();
    _dIdentity = Get.find<IdentityStore>().selectedIdentity.value;
    _transferStore.payerDID = _dIdentity.did.toString();
    _transferStore.balance = _dIdentity.accountInfo.balance?.humanReadable;
  }

  @override
  void dispose() {
    _transferStore.dispose();
    super.dispose();
  }

  void _onNext() {
    _transferStore.validateAll();
    if (!_transferStore.error.hasErrors) {
      _showConfirmDialog();
    }
  }

  void _showConfirmDialog() {
    _confirmDialogInstance = YYDialog().build(Get.overlayContext)
      ..backgroundColor = WalletColor.white
      ..borderRadius = 12.0
      ..width = 1000.0
      ..margin = const EdgeInsets.symmetric(horizontal: 24)
      ..widget(
        Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                '请核对转账信息',
                style: WalletFont.font_14(
                  textStyle: const TextStyle(fontWeight: FontWeight.w600),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: WalletColor.lightGrey,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '金额',
                      style: WalletFont.font_14(
                        textStyle: TextStyle(color: WalletColor.grey),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '￥${_transferStore.amount}',
                      style: WalletFont.font_16(),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '接收账户',
                      style: WalletFont.font_14(
                        textStyle: TextStyle(color: WalletColor.grey),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(top: 8),
                    child: Text(
                      _transferStore.payeeDID!,
                      style: WalletFont.font_16(),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20, top: 32),
              child: Text(
                '输入PIN码',
                style: WalletFont.font_16(),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InputPinWidget(key: _inputPinWidgetKey),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 34),
                    child: WalletTheme.button(text: '确定', onPressed: _onConfirm),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    child: WalletTheme.button(
                      text: '取消',
                      onPressed: () {
                        _confirmDialogInstance!.dismiss();
                        _confirmDialogInstance = null;
                      },
                      buttonType: ButtonType.outlineType,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
      ..animatedFunc = (child, animation) {
        return FadeTransition(
          opacity: Tween(begin: 0.0, end: 1.0).animate(animation),
          child: child,
        );
      }
      ..show();
  }

  Future<Object?> _onConfirm() async {
    final bool pinValidation = await _inputPinWidgetKey.currentState!.validatePin();
    final String payeeAddress = '0x${_transferStore.payeeDID!.substring(7)}';
    final String amount = _transferStore.amount!;
    if (pinValidation) {
      final bool transferSuccess = await _iStore.selectedIdentity.value.transferPoint(
        toAddress: payeeAddress,
        amount: Amount(Decimal.parse(amount.toString())),
      );
      if (transferSuccess && mounted) {
        return Navigator.pushNamed(
          context,
          Routes.txListDetails,
          arguments: TxListDetailsPageArgs(
            amount: amount,
            time: parseDateTime(DateTime.now()),
            status: TxStatus.transferring,
            fromAddress: _iStore.selectedIdentity.value.address,
            toAddress: payeeAddress,
            fromAddressName: _iStore.selectedIdentityName,
            isExpense: true,
            shouldBackToHome: true,
          ),
        );
      }
    }
    return null;
  }

  bool btnDisabled() {
    return _transferStore.amount == null ||
      _transferStore.amount!.isEmpty ||
      _transferStore.payeeDID == null ||
      _transferStore.payeeDID!.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => CommonLayout(
        withBottomBtn: true,
        btnText: '下一步',
        btnOnPressed: btnDisabled() ? null : _onNext,
        title: 'xxx',
        child: Column(
          children: <Widget>[
            _buildHeader(),
            _buildBody(),
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
        _iStore.selectedIdentityBalance?.humanReadableWithSymbol ?? '',
        style: WalletFont.font_24(textStyle: TextStyle(color: WalletColor.white)),
      ),
    );
  }

  Widget _buildBody() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 34),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          color: WalletColor.white,
        ),
        child: ListView(
          children: <Widget>[
            Text(
              '金额',
              style: WalletFont.font_14(
                textStyle: const TextStyle(fontWeight: FontWeight.w600),
              ),
              textAlign: TextAlign.left,
            ),
            TransferInputWidget(
              errorText: _transferStore.error.amount,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'\d+|\.'))
              ],
              onChange: (value) => _transferStore.amount = value,
            ),
            Container(
              margin: const EdgeInsets.only(top: 40, bottom: 16),
              child: Text(
                '接收账户',
                style: WalletFont.font_14(
                  textStyle: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildFunctionButton(
                  active: false,
                  iconAsset: 'assets/icons/address.svg',
                  title: '地址簿',
                  margin: const EdgeInsets.only(right: 20),
                ),
                _buildFunctionButton(
                  iconAsset: 'assets/icons/scan.svg',
                  title: '扫码识别',
                  onTap: () async {
                    final String? scanResult = await Application.router
                      .navigateTo(context, Routes.qrScanner) as String?;

                    if (true != scanResult?.isNotEmpty) {
                      return;
                    }

                    try {
                      final DID did = DID.parse(scanResult!);
                      _payeeAddressController.text = did.toString();
                      _transferStore.payeeDID = did.toString();
                    } catch (_) {
                      if (mounted) {
                        await hintDialogHelper(
                          context,
                          DialogType.warning,
                          '未识别到有效的身份信息',
                        );
                      }
                    }
                  },
                )
              ],
            ),
            TransferInputWidget(
              withPrefix: false,
              errorText: _transferStore.error.payeeDID,
              keyboardType: TextInputType.text,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9\:]+'))
              ],
              controller: _payeeAddressController,
              onChange: (value) => _transferStore.payeeDID = value,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFunctionButton({
    bool active = true,
    required String iconAsset,
    required String title,
    EdgeInsetsGeometry? margin,
    VoidCallback? onTap
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: margin,
          padding: const EdgeInsets.symmetric(vertical: 11),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: active ? WalletColor.primary : WalletColor.middleGrey,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(right: 8),
                child: SvgPicture.asset(iconAsset, color: WalletColor.white),
              ),
              Text(
                title,
                style: WalletFont.font_16(
                  textStyle: TextStyle(color: WalletColor.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
