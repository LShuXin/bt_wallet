import 'dart:async';

import 'package:flutter/material.dart';

import 'package:corsac_jwt/corsac_jwt.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';

import 'package:bt_wallet/common/theme/color.dart';
import 'package:bt_wallet/models/webview/pincode_dialog/pincode_dialog_style.dart';
import 'package:bt_wallet/widgets/pin_dialog.dart';

const tokenSecret = 'tokenSecret';

class PinCodeService {
  static YYDialog? dialogInstance;
  static Completer? completer;

  /// Flow:
  /// Checks the token via verifyToken.
  /// If valid → returns Future.value(true).
  /// If not valid:
  ///   - Builds a dialog using YYDialog.
  ///   - Displays a PinDialogWidget.
  ///   - Waits for user input via Completer.
  ///
  /// When the dialog is dismissed or completes → returns the result from the completer.
  static Future<dynamic> validate(
    String token,
    WebviewPincodeDialogStyle pinCodeDialogStyle,
  ) {
    if (verifyToken(token)) {
      return Future.value(true);
    }
    completer = Completer();
    dialogInstance = YYDialog().build()
      ..borderRadius = 12
      ..barrierColor = WalletColor.black.withOpacity(0.5)
      ..backgroundColor = WalletColor.white
      ..margin = const EdgeInsets.symmetric(horizontal: 24, vertical: 144)
      ..width = 1000
      ..widget(
        PinDialogWidget(
          completer: completer!,
          pincodeDialogStyle: pinCodeDialogStyle,
        ),
      )
      ..dismissCallBack = () {
        if (!completer!.isCompleted) {
          completer!.complete();
        }
      }
      ..show();
    return completer!.future.then((value) {
      dialogInstance!.dismiss();
      dialogInstance = null;
      return value;
    });
  }

  static void dismissPinCodeDialog() {
    if (dialogInstance != null) {
      dialogInstance!.dismiss();
    }
  }

  static String createToken() {
    final builder = JWTBuilder()
      ..expiresAt = DateTime.now().add(const Duration(seconds: 15))
      ..setClaim('name', 'dapp');
    final signer = JWTHmacSha256Signer(tokenSecret);
    final signedToken = builder.getSignedToken(signer);
    return signedToken.toString();
  }

  static bool verifyToken(String stringToken) {
    final signer = JWTHmacSha256Signer(tokenSecret);
    JWT decodedToken;
    try {
      decodedToken = JWT.parse(stringToken);
    } catch (e) {
      return false;
    }
    if (!decodedToken.verify(signer)) {
      return false;
    }

    final validator = JWTValidator();
    final Set<String> errors = validator.validate(decodedToken);
    return errors.isEmpty;
  }
}
