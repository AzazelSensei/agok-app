import 'package:flutter/material.dart';

import '../components/animations/fade_drop_animation.dart';

extension AnimatedKit on Widget {
  Widget addDropFade({required double delay}) => FadeAnimation(
        delay: delay,
        child: this,
      );
}
