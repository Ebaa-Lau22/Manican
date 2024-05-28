import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:manican/routing/appRouter.dart';
import 'package:manican/di/injectionContainer.dart' as di;

abstract class AppInitializer {
  static init() async {
    ///because binding should be initialized before calling runApp.
    WidgetsFlutterBinding.ensureInitialized();

    ///initialize EasyLocalization
   await EasyLocalization.ensureInitialized();

    ///initialize routing
    AppRouter.init();

    ///dependencies injection
    await di.init();

  }
}
