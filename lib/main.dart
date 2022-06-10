import 'package:agok_app/core/init/theme/theme_manager.dart';
import 'package:agok_app/features/home/view/home_view.dart';
import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      builder: (BuildContext conetxt, ThemeData theme) => MaterialApp(
        title: 'Flutter App',
        theme: theme,
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(
          title: 'Home',
        ),
      ),
      themeCollection: ThemeCollection(themes: {
        1: ThemeManager.theme,
        0: ThemeManager.darkTheme,
      }),
    );
  }
}
