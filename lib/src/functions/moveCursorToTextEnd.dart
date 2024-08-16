import 'package:flutter/material.dart';
void moveCursorToTextEnd(TextEditingController controller) {
  // Original function name: setCursorToEnd
  controller.selection = TextSelection.fromPosition(
    TextPosition(offset: controller.text.length),
  );
}