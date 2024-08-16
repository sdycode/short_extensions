import 'dart:io';

import 'package:short_extensions/short_extensions.dart';

Future<bool> showBacktoPreviousPageDialog(
  BuildContext context, {
  String? message,
  Color? dialogBgColor,
  Color? messageTextColor,
  Color? noBgColor,
  Color? noTextColor,
  Color? yesBgColor,
  Color? yesTextColor,
}) async {
  bool goBack = false;
  await showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          shape: 12.roundedCardShape(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextWidget.black(
                text: message ?? "Do you want to go back?",
                maxLines: 15,
                fontsize: 20,
                fontweight: FontWeight.w500,
              ).applySymmetricPadding(vertical: 8),
              Row(
                children: [
                  "Yes"
                      .roundButtonExpanded(
                          onTap: () async {
                            goBack = true;
                            exitOrAttemptExit(
                              context,
                            );
                          },
                          textColor: yesTextColor ?? Colors.black,
                          bgColor: yesBgColor ?? Colors.grey.shade300)
                      .applyHorizontalPadding(horizontal: 8)
                      .expandIfNeeded(),
                  "No"
                      .roundButtonExpanded(
                          onTap: () {
                            goBack = false;
                            exitOrAttemptExit(
                              context,
                            );
                          },
                          textColor: noTextColor ?? Colors.white,
                          bgColor: noBgColor ?? Colors.blue)
                      .applyHorizontalPadding(horizontal: 8)
                      .expandIfNeeded()
                ],
              ).applySymmetricPadding(vertical: 8)
            ],
          ),
        );
      });
  return goBack;
}

showExitDialog(
  BuildContext context,
 { String? message,
  Color? dialogBgColor,
  Color? messageTextColor,
  Color? noBgColor,
  Color? noTextColor,
  Color? yesBgColor,
  Color? yesTextColor,}
) async {
  await showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          shape: 12.roundedCardShape(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextWidget.black(
                text: message ?? "Do you want to close app ? ",
                maxLines: 30,
                fontsize: 20,
                fontweight: FontWeight.w600,
              ).applySymmetricPadding(vertical: 8),
              Row(
                children: [
                  "Yes"
                      .roundButtonExpanded(
                          onTap: () {
                            exit(0);
                          },
                          textColor: yesTextColor ?? Colors.black,
                          bgColor: yesBgColor ?? Colors.grey.shade300)
                      .applyHorizontalPadding(horizontal: 8)
                      .expandIfNeeded(),
                  "No"
                      .roundButtonExpanded(
                          onTap: () {
                            exitOrAttemptExit(context);
                          },
                          textColor: noTextColor ?? Colors.white,
                          bgColor: noBgColor ?? Colors.blue)
                      .applyHorizontalPadding(horizontal: 8)
                      .expandIfNeeded()
                ],
              ).applySymmetricPadding(vertical: 8)
            ],
          ),
        );
      });
}
