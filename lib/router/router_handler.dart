import 'package:flutter/material.dart';

import 'package:fluro/fluro.dart';
import 'package:optional/optional_internal.dart';

import 'package:bt_wallet/modules/create_hd_wallet/pages/create_hd_wallet_page.dart';
import 'package:bt_wallet/modules/confirm_hd_wallet/pages/confirm_hd_wallet.dart';
import 'package:bt_wallet/modules/dapp/pages/dapp_page.dart';
import 'package:bt_wallet/modules/home/home/pages/home_page.dart';
import 'package:bt_wallet/modules/home/identity/pages/identity_new_page.dart';
import 'package:bt_wallet/modules/home/mine/pages/message_page.dart';
import 'package:bt_wallet/modules/identity_qr/pages/identity_qr_code.dart';
import 'package:bt_wallet/modules/input_pin/pages/input_pin_page.dart';
import 'package:bt_wallet/modules/profile/pages/profile_page.dart';
import 'package:bt_wallet/modules/qr_scanner/pages/qr_scanner_page.dart';
import 'package:bt_wallet/modules/restore_hd_wallet/pages/restore_hd_wallet_page.dart';
import 'package:bt_wallet/modules/splash_screen/pages/splash_screen_page.dart';
import 'package:bt_wallet/modules/transfer/pages/transfer_page.dart';
import 'package:bt_wallet/modules/transfer/pages/transfer_confirm_page.dart';
import 'package:bt_wallet/modules/tx_list/pages/tx_list_details_page.dart';
import 'package:bt_wallet/modules/tx_list/pages/tx_list_page.dart';
import 'package:bt_wallet/modules/wallet_entry/pages/wallet_entry_page.dart';

Handler splashScreenPageHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return SplashScreenPage();
  },
);

Handler walletEntryPageHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return WalletEntryPage();
  },
);

Handler newIdentityHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return NewIdentityPage();
  },
);

Handler homeHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return Home(
      defaultIndex: int
        .parse(Optional.ofNullable(params['index'])
        .map((indexes) => indexes.first)
        .orElse('0'),
      ),
    );
  },
);

Handler inputPinHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return PinInputPage();
  },
);

Handler createHDWalletPageHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return CreateHDWalletPage();
  },
);

Handler confirmHDWalletPageHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return ConfirmHDWalletPage();
  },
);

Handler profileHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    final String id = params['id']!.first;
    return ProfilePage(id: id);
  },
);

Handler transferTwPointsHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return TransferPage();
  },
);

Handler txListHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const TxListPage();
  },
);

Handler txListDetailsHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return TxListDetailsPage();
  },
);

Handler transferConfirmHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    final String amount = params['amount']!.first;
    final String toAddress = params['toAddress']!.first;
    final String currency = params['currency']!.first;
    return TransferConfirmPage(
      currency: currency,
      amount: amount,
      toAddress: toAddress,
    );
  },
);

Handler qrPageHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return IdentityQRPage();
  },
);

Handler qrScannerHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return QrScannerPage();
  },
);

Handler messagePageHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const MessagePage();
  },
);

// Handler chatDetailPageHandler = Handler(
//   handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
//     return const ChatPage(
//       room: ,
//     );
//   },
// );


Handler dappHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return DAppPage(id: params['id']!.first);
  },
);

Handler restoreHDWalletHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return RestoreHDWalletPage();
  },
);