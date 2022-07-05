import 'package:agok_app/core/extensions/padding_kit.dart';
import 'package:agok_app/widget/main_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/constant/color_constant.dart';

class EmptyView extends StatelessWidget {
  final dynamic label;
  final Function()? onTryAgain;
  const EmptyView({Key? key, this.label, this.onTryAgain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.4;
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FaIcon(
          FontAwesomeIcons.clipboardList,
          size: size,
          color: ColorConstant.headline.withOpacity(0.6),
        ),
        Padding(
          padding: context.paddingNormal,
          child: Text(
            label.toString(),
            textAlign: TextAlign.center,
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (onTryAgain != null)
          MainButton(onPressed: onTryAgain, label: 'Try Again')
      ],
    ));
  }
}
