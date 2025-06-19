import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bt_wallet/common/theme/color.dart';
import 'package:bt_wallet/common/theme/font.dart';
import 'package:bt_wallet/common/theme/index.dart';
import 'package:bt_wallet/models/webview/pincode_dialog/pincode_dialog_style.dart';
import 'package:bt_wallet/service/pin_code_service.dart';
import 'package:bt_wallet/views/transfer_confirm/widgets/input_pin.dart';

class PinDialogWidget extends StatelessWidget {
  final Completer completer;
  final WebviewPincodeDialogStyle pincodeDialogStyle;
  final GlobalKey<InputPinWidgetState> inputPinWidgetKey =
      GlobalKey<InputPinWidgetState>();

  PinDialogWidget({required this.completer, required this.pincodeDialogStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 50),
      color: WalletColor.white,
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () => PinCodeService.dismissPinCodeDialog(),
            child: Align(
              alignment: Alignment.centerRight,
              child: SvgPicture.asset(
                'assets/icons/pin-code-close.svg',
                width: pincodeDialogStyle.closeIcon.size,
                height: pincodeDialogStyle.closeIcon.size,
                color: WalletTheme.rgbColor(
                  pincodeDialogStyle.closeIcon.color,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Text(
              pincodeDialogStyle.title.text,
              textAlign: TextAlign.center,
              style: WalletFont.font_16(
                textStyle: TextStyle(
                  color: WalletTheme.rgbColor(
                    pincodeDialogStyle.title.color,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 16),
            child: Text(
              pincodeDialogStyle.hintMsg.text,
              textAlign: TextAlign.center,
              style: WalletFont.font_12(
                textStyle: TextStyle(
                  color: WalletTheme.rgbColor(
                    pincodeDialogStyle.hintMsg.color,
                  ),
                ),
              ),
            ),
          ),
          InputPinWidget(
            key: inputPinWidgetKey,
            autoValidate: true,
            completer: completer,
            pincodeDialogInput: pincodeDialogStyle.inputFields,
            pincodeDialogErrorMsg: pincodeDialogStyle.errorMsg,
          ),
        ],
      ),
    );
  }
}
