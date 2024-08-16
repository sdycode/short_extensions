import 'package:flutter/material.dart';

void placeCursorAtTextEnd(TextEditingController textController) {
  // Original function name: moveCursorToEnd
  textController.selection = TextSelection.fromPosition(
    TextPosition(offset: textController.text.length),
  );
}
