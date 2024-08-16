

import 'package:flutter/material.dart';
void dismissKeyboard() {
  // Original function name: unfocusTextFields
  FocusManager.instance.primaryFocus?.unfocus();
}