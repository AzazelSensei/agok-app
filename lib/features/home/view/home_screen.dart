// ignore_for_file: unused_element, unused_import, deprecated_member_use, duplicate_ignore

import 'package:agok_app/core/extensions/int_extension.dart';
import 'package:agok_app/core/extensions/widget_extension.dart';
import 'package:agok_app/core/init/locale_keys.g.dart';
import 'package:agok_app/core/init/router/app_router.dart';
import 'package:agok_app/core/init/theme/colors_manager.dart';
import 'package:agok_app/core/init/theme/theme_manager.dart';
import 'package:agok_app/core/extensions/ui_extension.dart';
import 'package:agok_app/widget/main_button.dart';
import 'package:agok_app/widget/search_field.dart';
import 'package:agok_app/widget/bottom_loading.dart';
import 'package:agok_app/widget/mode_switcher.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../widget/label_chip.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Color? color, borderColor, fontColor;
  final imageUrl =
      "https://www.muratoner.net/wp-content/uploads/2019/01/flutterlogo.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
        leading: Builder(
            builder: (context) => // Ensure Scaffold is in context
                IconButton(
                    icon: iconType(context),
                    onPressed: () => Scaffold.of(context).openDrawer())),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: context.right,
            child: const ModeSwitcher(),
          )
        ],
        title: Center(child: autoSizeText(context)),
      ),
      
      drawer: const Drawer(),
      body: Padding(
        padding: context.lowHorPadding,
        child: ListView(
          children: [
            const SearchField(),
            buildSnackBar(),
            const LabelChip(),
            // MainButton(),
            SizedBox(
              height: context.dynamicWidth(0.3),
              child: Row(
                children: [
                  Expanded(child: buildCard()),
                  Expanded(child: buildCard()),
                  Expanded(child: buildCard()),
                  Expanded(child: buildCard())
                ],
              ),
            ),
            SizedBox(
              height: context.dynamicWidth(0.05),
            ),
            SizedBox(
              height: context.dynamicWidth(0.13),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: context.right * 2,
                  child: Card(
                      margin: EdgeInsets.all(context.dynamicWidth(0.02)),
                      color: Colors.black12.withOpacity(0.01),
                      child: Padding(
                        padding: EdgeInsets.all(context.dynamicWidth(0.02)),
                        child: Text(
                          "data",
                          style: context.theme.textTheme.headline6,
                        ),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
      // body: Container(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     context.router.pushAndPopUntil(
      //       const LoginRoute(),
      //       predicate: (route) => true,
      //     );
      //   },
      //   tooltip: '',
      //   child: const Icon(Icons.add).addPadding(),
      // ),
    );
  }

  Icon iconType(BuildContext context) {
    return Icon(
      Icons.menu,
      color: fontColor ??
          (ThemeManager.isDark(context)
              ? Colors.white
              : ColorManager.greyColor),
    );
  }

  AutoSizeText autoSizeText(BuildContext context) {
    return AutoSizeText.rich(
      TextSpan(
        text: LocaleKeys.login,
        style: TextStyle(
          color: fontColor ??
              (ThemeManager.isDark(context)
                  ? Colors.white
                  : ColorManager.greyColor),
          fontWeight: FontWeight.w700,
        ),
      ),
      minFontSize: 20,
      maxFontSize: 25,
    );
  }

  Card buildCard() {
    return Card(
      child: ListTile(
        title: Image.network(imageUrl),
        subtitle: Text(
          "Sample",
          style: context.theme.textTheme.headline6,
        ),
      ),
    );
  }

  Builder buildSnackBar() => Builder(
        builder: (context) => Center(
          //new context
          // ignore: deprecated_member_use
          child: RaisedButton(
            color: Colors.black,
            textColor: Colors.white,
            onPressed: () {
              const snackBar = SnackBar(content: Text('Profile saved'));
              scaffoldKey.currentState!.showSnackBar(snackBar);
            },
            child: const Text('View'),
          ),
        ),
      );
}
