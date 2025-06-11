import 'package:flutter/material.dart';
import 'package:bt_wallet_flutter_01/common/theme/color.dart';
import 'package:bt_wallet_flutter_01/common/theme/font.dart';

enum ButtonType { defaultType, outlineType }

class WalletTheme {
  static Color get titleBgColor => rgbColor('0xfafafa');
  static Color get mainBgColor => rgbColor('0xf2f2f2');
  static Color get listItemBgColor => rgbColor('0xf6f6f6');

  static Widget button(
      {String? text,
      VoidCallback? onPressed,
      ButtonType buttonType = ButtonType.defaultType,
      double height = 45,
      Color? outlineColor}) {
    final ElevatedButton raisedButton = ElevatedButton(
      style: ButtonStyle(
        elevation: WidgetStatePropertyAll(0),
        backgroundColor: WidgetStatePropertyAll(
          null == onPressed ? WalletColor.middleGrey : WalletColor.primary,
        ),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)))
      ),
      onPressed: onPressed,
      child: Center(
        child: Text(
          text!,
          style: WalletFont.font_16(
            textStyle: TextStyle(color: WalletColor.white),
          ),
        ),
      ),
    );
    final OutlinedButton outlineButton = OutlinedButton(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),),
        textStyle: WidgetStatePropertyAll(TextStyle().copyWith(
          color: null == onPressed ? WalletColor.middleGrey : (outlineColor ?? WalletColor.primary),
        )),
      ),
      // disabledBorderColor: WalletColor.middleGrey,
      // borderSide: BorderSide(color: outlineColor ?? WalletColor.primary),
      // highlightedBorderColor: outlineColor ?? WalletColor.primary,
      onPressed: onPressed,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            height: 1.38,
            fontFamily: 'PingFangHK',
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
        ),
      ),
    );
    return ButtonTheme(
      height: height,
      child:
          buttonType == ButtonType.defaultType ? raisedButton : outlineButton,
    );
  }

  static Color rgbColor(String colorString, {double alpha = 1.0}) {
    String colorStr = colorString;

    if (!colorStr.startsWith('0xff') && colorStr.length == 6) {
      colorStr = '0xff$colorStr';
    }

    if (colorStr.startsWith('0x') && colorStr.length == 8) {
      colorStr = colorStr.replaceRange(0, 2, '0xff');
    }
    if (colorStr.startsWith('#') && colorStr.length == 7) {
      colorStr = colorStr.replaceRange(0, 1, '0xff');
    }

    final Color color = Color(int.parse(colorStr));
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;

    return Color.fromRGBO(red, green, blue, alpha);
  }
}
