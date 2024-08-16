import 'package:short_extensions/short_extensions.dart';

Future showDeleteConfirmationDialog(
  BuildContext context, {
  required VoidCallback onDelete,
  TextWidget? messageWidget,
  String? message,
  Color? dialogBgColor,
  Color? messageTextColor,
  Color? deleteBgColor,
  Color? deleteTextColor,
  Color? cancelBgColor,
  Color? cancelTextColor,
}) async {
  await showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          shape: 12.roundedCardShape(),
          backgroundColor: dialogBgColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (messageWidget == null)
                TextWidget(
                  text: message ?? "Do you really want to delete account ?",
                  maxLines: 40,
                  fontsize: 24,
                  fontweight: FontWeight.w600,
                  color: messageTextColor ?? Colors.black,
                ).applySymmetricPadding(vertical: 8),
              if (messageWidget != null) messageWidget,
              Row(
                children: [
                  "Delete"
                      .roundButtonExpanded(
                          onTap: () {
                            exitOrAttemptExit(context);
                            onDelete();
                          },
                          textColor: deleteTextColor,
                          bgColor: deleteBgColor ?? Colors.red)
                      .applyHorizontalPadding(horizontal: 8)
                      .expandIfNeeded(),
                  "Cancel"
                      .roundButtonExpanded(
                        onTap: () {
                          exitOrAttemptExit(context);
                        },
                        textColor: cancelTextColor,
                        bgColor: cancelBgColor,
                      )
                      .applyHorizontalPadding(horizontal: 8)
                      .expandIfNeeded()
                ],
              ).applySymmetricPadding(vertical: 8)
            ],
          ),
        );
      });
}
