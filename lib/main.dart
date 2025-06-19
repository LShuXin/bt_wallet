import 'dart:async';

import 'package:bt_wallet/common/getx.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sentry/sentry.dart';

import 'package:bt_wallet/common/application.dart';
import 'package:bt_wallet/common/theme/color.dart';
import 'package:bt_wallet/common/theme/font.dart';
import 'package:bt_wallet/router/routers.dart';
import 'package:bt_wallet/views/splash_screen/splash_screen_page.dart';

// native crash support
final SentryClient sentry = SentryClient(SentryOptions(dsn: 'https://cbc45c2b4f0f400797ca489f4f117699@o402661.ingest.sentry.io/5264109'));

bool get isInDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

Future<Future<SentryId>> _reportError(dynamic error, dynamic stackTrace) async {
  return sentry.captureException(
    false,
    stackTrace: stackTrace,
  );
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Application.appName = (await PackageInfo.fromPlatform()).appName;
  await initGlobalDependencies();
  FlutterError.onError = (FlutterErrorDetails details) async {
    if (isInDebugMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      await _reportError(details.exception, details.stack);
    }
  };

  runApp(TWallet());

  // runZonedGuarded(
  //   () => runApp(TWallet()),
  //   (error, stackTrace) async {
  //     await _reportError(error, stackTrace);
  //   },
  // );
}

class TWallet extends StatelessWidget {
  TWallet({super.key}) {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (ctx, wid) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: Application.appName,
        theme: ThemeData(
          primaryColor: WalletColor.white,
          textTheme: TextTheme(
            bodyMedium: WalletFont.font_14(
              textStyle: TextStyle(
                color: WalletColor.primary,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          disabledColor: Colors.grey,
          fontFamily: 'PingFangHK',
        ),
        initialRoute: Routes.splashScreen,
        onGenerateRoute: Application.router.generator,
      ),
    );
  }
}
