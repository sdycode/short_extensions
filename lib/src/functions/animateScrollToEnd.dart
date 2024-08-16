import 'package:short_extensions/short_extensions.dart';

void animateScrollToEnd(
  ScrollController controller, {
  int additionalDelay = 0,
  int instantTimeInMillsec = 200,
  int stdDelayToStartScroll = 1500,
}) {
  // Original function name: scrollToBottom
  if (controller.hasClients) {
    controller.animateTo(
      controller.position.maxScrollExtent,
      duration: Duration(milliseconds: instantTimeInMillsec),
      curve: Curves.easeInOut,
    );

    Future.delayed(
            Duration(milliseconds: stdDelayToStartScroll + additionalDelay))
        .then((_) {
      if (controller.hasClients) {
        controller.animateTo(
          controller.position.maxScrollExtent,
          duration: Duration(milliseconds: instantTimeInMillsec),
          curve: Curves.easeInOut,
        );
      }
    });
  }
}
