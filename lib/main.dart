import 'package:agok_app/core/init/theme/colors_manager.dart';
import 'package:agok_app/core/init/theme/theme_manager.dart';
import 'package:agok_app/widget/mode_switcher.dart';
import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';
import 'package:agok_app/core/extensions/int_extension.dart';
import 'package:agok_app/core/extensions/widget_extension.dart';

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
        title: 'asdasd',
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Color? color, borderColor, fontColor;

  void _incrementCounter() {
    setState(() {
      _counter = _counter.increase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [ModeSwitcher()],
        title: Text(
          widget.title,
          style: TextStyle(
              color: fontColor ??
                  (ThemeManager.isDark(context)
                      ? Colors.white
                      : ColorManager.purple),
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        color: color ??
            (ThemeManager.isDark(context)
                ? ColorManager.greyColor
                : Colors.white),
      ).addPadding(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
