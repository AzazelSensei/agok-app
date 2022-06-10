import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget addPadding() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: this,
    );
  }
}
