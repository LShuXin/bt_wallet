import 'package:fluro/fluro.dart';

import 'package:bt_wallet/models/env.dart';

enum ENV {
  production,
  dev,
}

class Application {
  static ENV env = ENV.dev;

  static Env globalEnv = Env.fromDefault();

  static String appName = '';

  static FluroRouter router = FluroRouter.appRouter;

  Map<String, String> get config {
    if (Application.env == ENV.production) {
      return {};
    }
    if (Application.env == ENV.dev) {
      return {};
    }
    return {};
  }
}
