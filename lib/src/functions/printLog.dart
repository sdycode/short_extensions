import 'dart:developer';

import 'package:flutter/foundation.dart';

void printLog(String s) {
  if (kDebugMode) {
    log(s);
  }
}
 