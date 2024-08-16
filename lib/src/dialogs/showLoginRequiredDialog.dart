import 'package:flutter/material.dart';
import 'package:short_extensions/short_extensions.dart';

Future showLoginRequiredDialog(BuildContext context,
    {required String message,
    Color? messageColor,
    required Widget loginPageWidget}) async {
  await showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          shape: 12.roundedCardShape(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextWidget(
                text: message,
                maxLines: 5,
                fontsize: 20,
                color: messageColor ?? Colors.black,
                fontweight: FontWeight.bold,
              ).applySymmetricPadding(vertical: 12),
              "Login".elButton(onTap: () {
                goToWithTransitionToScreen(context, loginPageWidget);
              }).applySymmetricPadding()
            ],
          ),
        );
      });
}
