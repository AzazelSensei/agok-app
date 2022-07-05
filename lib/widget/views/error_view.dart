import 'package:agok_app/core/extensions/padding_kit.dart';
import 'package:agok_app/widget/main_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorView extends StatelessWidget {
  final dynamic error;
  final Function()? onTryAgain;
  const ErrorView({Key? key, this.error, this.onTryAgain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.4;
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset(
          'assets/images/lot_error.json',
          width: size,
          height: size,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: context.paddingNormal,
          child: Text(
            error.toString(),
            textAlign: TextAlign.center,
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
            style: null,
          ),
        ),
        if (onTryAgain != null)
          MainButton(onPressed: onTryAgain, label: 'Try Again')
      ],
    ));
  }
}
