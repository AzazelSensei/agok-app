import 'package:flutter/cupertino.dart';

extension UIEx on BuildContext {
  Size get toSize => MediaQuery.of(this).size;

  EdgeInsets get lowPadding => EdgeInsets.all(toSize.height * 0.09);
  EdgeInsets get normalPadding => EdgeInsets.all(toSize.height * 0.12);
  EdgeInsets get largePadding => EdgeInsets.all(toSize.height * 0.2);

  EdgeInsets get lowHorPadding =>
      EdgeInsets.symmetric(horizontal: toSize.height * 0.02);
  EdgeInsets get normalHorPadding =>
      EdgeInsets.symmetric(horizontal: toSize.height * 0.06);
  EdgeInsets get largeHorPadding =>
      EdgeInsets.symmetric(horizontal: toSize.height * 0.2);

  EdgeInsets get lowVerPadding =>
      EdgeInsets.symmetric(vertical: toSize.height * 0.02);
  EdgeInsets get normalVerPadding =>
      EdgeInsets.symmetric(vertical: toSize.height * 0.06);
  EdgeInsets get largeVerPadding =>
      EdgeInsets.symmetric(vertical: toSize.height * 0.2);

  EdgeInsets get left => EdgeInsets.only(left: toSize.height * 0.02);
  EdgeInsets get right => EdgeInsets.only(right: toSize.height * 0.02);
  EdgeInsets get top => EdgeInsets.only(top: toSize.height * 0.02);
  EdgeInsets get bottom => EdgeInsets.only(bottom: toSize.height * 0.02);

  EdgeInsets get rightBottom => EdgeInsets.only(
      bottom: toSize.height * 0.02, right: toSize.height * 0.02);

  EdgeInsets get lowSymAllPadding => EdgeInsets.symmetric(
      horizontal: toSize.height * 0.02, vertical: toSize.height * 0.018);
  EdgeInsets get normalSymAllPadding => EdgeInsets.symmetric(
      horizontal: toSize.height * 0.12, vertical: toSize.height * 0.12);
  EdgeInsets get largeSymAllPadding => EdgeInsets.symmetric(
      horizontal: toSize.height * 0.2, vertical: toSize.height * 0.2);

  double get lowHeight => toSize.height * 0.025;
  double get normalHeight => toSize.height * 0.05;
  double get largeHeight => toSize.height * 0.07;

  double get lowWidth => toSize.width * 0.025;
  double get normalWidth => toSize.width * 0.5;
  double get largeWidth => toSize.width * 0.7;
}
