import 'package:agok_app/core/extensions/int_extension.dart';
import 'package:agok_app/core/extensions/widget_extension.dart';
import 'package:agok_app/core/init/theme/colors_manager.dart';
import 'package:agok_app/core/init/theme/theme_manager.dart';
import 'package:agok_app/core/extensions/ui_extension.dart';
import 'package:agok_app/widget/mode_switcher.dart';
import 'package:flutter/material.dart';

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
        actions: [
          Padding(
            padding: context.right,
            child: const ModeSwitcher(),
          )
        ],
        title: Padding(
          padding: context.left,
          child: Text(
            widget.title,
            style: TextStyle(
                color: fontColor ??
                    (ThemeManager.isDark(context)
                        ? Colors.white
                        : ColorManager.greyColor),
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add).addPadding(),
      ),
    );
  }
}
