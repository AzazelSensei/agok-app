// ignore_for_file: dead_code, unused_import

import 'package:agok_app/core/init/localization/localization_init.dart';
import 'package:agok_app/core/init/router/app_router.dart';
import 'package:agok_app/core/init/theme/theme_manager.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:agok_app/features/home/view/home_screen.dart';
import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final _localizationInit = LocalizationInit();

  runApp(
    EasyLocalization(
        supportedLocales: _localizationInit.supportedLocales,
        path: _localizationInit.localizationPath,
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      builder: (BuildContext context, ThemeData theme) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: theme,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: _appRouter.delegate()),
      themeCollection: ThemeCollection(themes: {
        1: ThemeManager.theme,
        0: ThemeManager.darkTheme,
      }),
    );
  }
}
