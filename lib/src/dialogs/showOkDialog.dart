 
import 'package:short_extensions/short_extensions.dart';

showOkDialog(
  BuildContext context, {
  String ok = "Ok",
  barrierDismissible = true,
  required String okMessage,
  Color? okMessageTextColor,
  VoidCallback? onOkClicked,
  VoidCallback? secondaryTextButtonTap,
  String secondaryText = "skip",
  Color? secondaryTextColor,
}) async {
  await showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (_) {
        return Dialog(
          shape: 12.roundedCardShape(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextWidget(
                color: okMessageTextColor ?? Colors.black,
                text: okMessage,
                maxLines: 10,
                fontsize: 22,
                fontweight: FontWeight.w500,
              ).applySymmetricPadding(vertical: 8),
              ok.elButton(
                onTap: () async {
                  exitOrAttemptExit(context, enforceExit: false);
                  if (onOkClicked != null) {
                    onOkClicked();
                  }
                },
              ).applySymmetricPadding(vertical: 12, horizontal: 8),
              if (secondaryTextButtonTap != null)
                TextButton(
                    onPressed: secondaryTextButtonTap,
                    child: TextWidget(
                      text: secondaryText,
                      fontsize: 16,
                      color: secondaryTextColor ?? Colors.grey,
                    ))
            ],
          ),
        );
      });
}
