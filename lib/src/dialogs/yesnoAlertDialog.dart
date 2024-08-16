import 'package:short_extensions/short_extensions.dart';

Future<bool?> showYesNoAlertDialog(
  BuildContext context, {
  String yes = "Yes",
  String no = "No",
  bool popAfterYesClicked = true,
  required String confirmMessage,
  required VoidCallback onYesClicked,
  VoidCallback? onNoClicked,
  Color? dialogBgColor,
  Color? messageTextColor,
  Color? noBgColor,
  Color? noTextColor,
  Color? yesBgColor,
  Color? yesTextColor,
}) async {
  return showDialog<bool>(
      context: context,
      builder: (_) {
        return Dialog(
          shape: 12.roundedCardShape(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextWidget(
                text: confirmMessage,
                maxLines: 10,
                fontsize: 22,
                fontweight: FontWeight.w600,
                color: messageTextColor ?? Colors.black,
              ).applySymmetricPadding(vertical: 8),
              Row(
                children: [
                  "Yes"
                      .roundButtonExpanded(
                          onTap: () {
                            if (popAfterYesClicked) {
                              onYesClicked();
                              exitOrAttemptExit(context,
                                  enforceExit: false, returnValue: true);
                            } else {
                              exitOrAttemptExit(context,
                                  enforceExit: false, returnValue: true);
                              onYesClicked();
                            }
                          },
                          textColor: yesTextColor ?? Colors.black,
                          bgColor: yesBgColor ?? Colors.grey.shade300)
                      .applyHorizontalPadding(horizontal: 8)
                      .expandIfNeeded(),
                  "No"
                      .roundButtonExpanded(
                          onTap: () {
                            if (onNoClicked != null) {
                              onNoClicked();
                            }
                            exitOrAttemptExit(context,
                                enforceExit: false, returnValue: false);
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
