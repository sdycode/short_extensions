import 'package:flutter/material.dart';
Future goToScreen(BuildContext ctx, Widget destinationPage) async {
  // Original function name: navigateTo
  return await Navigator.push(
    ctx,
    MaterialPageRoute(
      builder: (ctx) => destinationPage,
    ),
  );
}

Future<bool?> exitOrAttemptExit(BuildContext ctx,
    {bool enforceExit = true, bool? returnValue}) async {
  // Original function name: navigatePopContext
  if (enforceExit) {
    Navigator.pop<bool?>(ctx, returnValue);
    return returnValue;
  } else {
    return await Navigator.maybePop(ctx, returnValue);
  }
}
