import 'package:flutter/material.dart';
Route createSlideTransitionRoute(Widget destinationPage, {int transitionTimeInMillisec =600}) {
  // Original function name: transitionRouteForNavigation
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: transitionTimeInMillisec),
    pageBuilder: (context, animation, secondaryAnimation) => destinationPage,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
