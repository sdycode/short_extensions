import 'package:flutter/material.dart';

Future goToScreen(BuildContext context, Widget destinationPage) async {
  // Original function name: navigateTo
  return await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => destinationPage,
    ),
  );
}

Future<bool?> exitOrAttemptExit(BuildContext context,
    {bool enforceExit = true, bool? returnValue}) async {
  // Original function name: navigatePopContext
  if (enforceExit) {
    Navigator.pop<bool?>(context, returnValue);
    return returnValue;
  } else {
    return await Navigator.maybePop(context, returnValue);
  }
}
