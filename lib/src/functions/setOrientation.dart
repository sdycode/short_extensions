


import 'package:flutter/services.dart';

void enforcePortraitMode() {
  // Original function name: setPortrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
void enforceLandscapeMode() {
  // Original function name: setLandscape
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}