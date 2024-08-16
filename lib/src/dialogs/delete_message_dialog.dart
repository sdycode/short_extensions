import 'package:short_extensions/short_extensions.dart';

Future showDeleteMessageDialog(
  BuildContext context, {
  required VoidCallback onDelete,
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextWidget(
                text: "Do you want to delete this message?",
                maxLines: 4,
                fontsize: 22,
                fontweight: FontWeight.w600,
                color: messageTextColor ?? Colors.black,
              ).applySymmetricPadding(vertical: 8),
              Row(
                children: [
                  "Delete"
                      .roundButtonExpanded(
                          onTap: () {
                            exitOrAttemptExit(context);
                            onDelete();
                          },
                          textColor: deleteTextColor ?? Colors.white,
                          bgColor: deleteBgColor ?? Colors.red)
                      .applyHorizontalPadding(horizontal: 8)
                      .expandIfNeeded(),
                  "Cancel"
                      .roundButtonExpanded(
                          onTap: () {
                            exitOrAttemptExit(context);
                          },
                          textColor: cancelTextColor??Colors.white,
                          bgColor:cancelBgColor?? Colors.blue)
                      .applyHorizontalPadding(horizontal: 8)
                      .expandIfNeeded()
                ],
              ).applySymmetricPadding(vertical: 8)
            ],
          ),
        );
      });
}
