import 'package:flutter/material.dart';

import 'package:agok_app/core/extensions/ui_extension.dart';
import 'package:agok_app/core/extensions/theme_kit.dart';
import 'package:agok_app/core/extensions/padding_kit.dart';

class LabelChip extends StatelessWidget {
  final String? label;
  final Color? color;
  const LabelChip({Key? key, this.label, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingLowCARD,
      decoration: BoxDecoration(
          borderRadius: context.normalBorderRadius,
          color: color?.withOpacity(0.2)),
      child: Text(
        label ?? '',
        style: context.bodyText2
            .copyWith(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }
}
