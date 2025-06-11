import 'package:bt_wallet_flutter_01/views/restore_hd_wallet/restore_hd_wallet.dart';
import 'package:bt_wallet_flutter_01/views/splash_screen/splash_screen_page.dart';
import 'package:flutter/material.dart';

import 'package:fluro/fluro.dart';
import 'package:optional/optional_internal.dart';

import 'package:bt_wallet_flutter_01/views/create_hd_wallet/create_hd_wallet_page.dart';
import 'package:bt_wallet_flutter_01/views/confirm_hd_wallet/confirm_hd_wallet.dart';
import 'package:bt_wallet_flutter_01/views/dapp/dapp.dart';
import 'package:bt_wallet_flutter_01/views/home/my/chat.dart';
import 'package:bt_wallet_flutter_01/views/home/home.dart';
import 'package:bt_wallet_flutter_01/views/home/identity/identity_new_page.dart';
import 'package:bt_wallet_flutter_01/views/home/my/message_page.dart';
import 'package:bt_wallet_flutter_01/views/identity_qr/identity_qr_code.dart';
import 'package:bt_wallet_flutter_01/views/input_pin/input_pin_page.dart';
import 'package:bt_wallet_flutter_01/views/wallet_entry/wallet_entry_page.dart';
import 'package:bt_wallet_flutter_01/views/profile/profile.dart';
import 'package:bt_wallet_flutter_01/views/qr_scanner/qr_scanner.dart';
import 'package:bt_wallet_flutter_01/views/restore_hd_wallet/restore_hd_wallet.dart';
import 'package:bt_wallet_flutter_01/views/transfer/transfer.dart';
import 'package:bt_wallet_flutter_01/views/transfer_confirm/transfer_confirm.dart';
import 'package:bt_wallet_flutter_01/views/tx_list/tx_list_details_page.dart';
import 'package:bt_wallet_flutter_01/views/tx_list/tx_list_page.dart';

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