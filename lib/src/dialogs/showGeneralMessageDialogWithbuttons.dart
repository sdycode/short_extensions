import 'package:short_extensions/short_extensions.dart';

Future showGeneralMessageDialogWithbutton(BuildContext context,
    {required String message,
    String buttonText = "OK",
    double vertPad = 12,
    bool popAfterOnTap = false,
    Color? dialogBgColor,
    Color? messageColor,
    Color? btnBgColor,
    Color? btnTextColor,
    VoidCallback? onTap}) async {
  await showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          backgroundColor: dialogBgColor,
          shape: 12.roundedCardShape(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextWidget(
                color: messageColor ?? Colors.black,
                text: message,
                maxLines: 50,
              ).applyVerticalOnlyPadding(vertical: vertPad),
              buttonText.elButton(
                  bgColor: btnBgColor,
                  textColor: btnBgColor,
                  onTap: () {
                    if (popAfterOnTap) {
                      if (onTap != null) {
                        onTap();
                        exitOrAttemptExit(context);
                      }
                    } else {
                      if (onTap != null) {
                        exitOrAttemptExit(context);
                        onTap();
                      }
                    }
                  })
            ],
          ).applyPadding(),
        );
      });
}
