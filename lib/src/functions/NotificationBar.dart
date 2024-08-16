import 'package:get/get.dart';

import 'package:short_extensions/short_extensions.dart';

class NotificationBar {
  // Original class name: SnackBarMessage
  static void display(
      {required BuildContext context,
      required String content,
      int durationInSeconds = 2}) {
    // Original method name: show
    triggerSnackbar(content, seconds: durationInSeconds);
  }
}

triggerSnackbar(String content,
    {int seconds = 2, String actionText = "OK", Color? actionTextColor}) {
  // Original method name: showSnackbar
  Get.showSnackbar(GetSnackBar(
    dismissDirection: DismissDirection.horizontal,
    duration: Duration(seconds: seconds),
    message: content, // Original parameter name: message
    mainButton: InkWell(
      onTap: () {
        Get.back();
      },
      child: TextWidget(
        text: actionText, // Original parameter name: buttonText
        color: actionTextColor ??
            Colors.blue, // Original parameter name: textColor
        fontsize: 20,
      ).applyPadding(),
    ),
  ));
  return;
}
