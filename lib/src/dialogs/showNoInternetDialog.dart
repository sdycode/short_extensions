 
import 'package:short_extensions/short_extensions.dart';

void showNoInternetDialog(BuildContext context) async {
  if (await internetAvaliable()) {
    return;
  }
  await showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          shape: 20.roundedCardShape(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextWidget.black(
                text: "Check Internet Connection",
                maxLines: 3,
              ).applySymmetricPadding().applyVerticalOnlyPadding(),
              "OK".elButton(onTap: () {
                exitOrAttemptExit(context);
              }).applySymmetricPadding()
            ],
          ),
        );
      });
}
