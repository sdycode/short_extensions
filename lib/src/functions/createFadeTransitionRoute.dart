import 'package:flutter/material.dart';





Route createFadeTransitionRoute(Widget destinationPage,
    {int transitionTimeInMillisec = 1500}) {
  // Original function name: transitionFadeRouteForNavigation
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: transitionTimeInMillisec),
    pageBuilder: (context, animation, secondaryAnimation) => destinationPage,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const double begin = 0;
      const double end = 1;
      const curve = Curves.ease;

      var tween =
          Tween<double>(begin: begin, end: end).chain(CurveTween(curve: curve));

      return FadeTransition(
        opacity: animation.drive(tween),
        child: child,
      );
    },
  );
}

Future goToWithFadeTransition(
    BuildContext context, Widget destinationPage) async {
  // Original function name: navigateWithFadeTransitionToScreen
  return await Navigator.push(
      context, createFadeTransitionRoute(destinationPage));
}

Future goToAndReplaceWithFadeTransition(
    BuildContext context, Widget destinationPage) async {
  // Original function name: navigateWithFReplacedFadeTransitionToScreen
  return await Navigator.pushReplacement(
      context, createFadeTransitionRoute(destinationPage));
}
