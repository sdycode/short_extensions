import 'dart:math';

import 'package:short_extensions/short_extensions.dart';
 extension StringUtils on String {
  bool canBeParsedToDouble() {
    return double.tryParse(this) != null;
  }

  bool canBeParsedToInt() {
    return int.tryParse(this) != null;
  }

  double convertToDouble() {
    if (canBeParsedToDouble()) {
      return double.parse(this);
    }
    return 0;
  }

  int parseToInt([int fallback = 0]) {
    if (canBeParsedToDouble()) {
      return double.parse(this).toInt();
    }
    return fallback;
  }
}

bool isConvertibleToDouble(String value) {
  return double.tryParse(value) != null;
}

int roundUpToNextFiveMultiple(int num) {
  if (num % 5 == 0) {
    return num;
  } else {
    return ((num ~/ 5) + 1) * 5;
  }
}

double convertStringToDouble(String value) {
  if (isConvertibleToDouble(value)) {
    return double.parse(value);
  }
  return 0;
}

extension NumUtils on num {
  EdgeInsetsGeometry padAll() {
    return EdgeInsets.all(this.toDouble());
  }

  EdgeInsetsGeometry padHorz() {
    return EdgeInsets.symmetric(horizontal: this.toDouble());
  }

  EdgeInsetsGeometry padVert() {
    return EdgeInsets.symmetric(vertical: this.toDouble());
  }
}
extension IntUtils on int {
  int generateRandom() {
    return Random().nextInt(this);
  }

  String ordinal() {
    switch (this) {
      case 1:
        return "1st";
      case 2:
        return "2nd";
      case 3:
        return "3rd";

      default:
        return "${toString()}th";
    }
  }

  String formatAsTwoDigit() {
    // singleToDoubleDigit
    if (this < 10) {
      return "0$this";
    }
    return toString();
  }

  int getSecondsRemainder() {
    return this % 60;
  }

  int increaseValue([int step = 1, int? maxLimit]) {
    if (maxLimit != null && this + 1 > maxLimit) {
      return this;
    }
    return this + step;
  }

  int incrementWithinLimit({int maxCap = 25}) {
    if (this + 1 > maxCap) {
      return this;
    }
    return this + 1;
  }

  int decreaseValueToZero({int decrement = 1}) {
    if (this - decrement < 0) {
      return 0;
    } else {
      return this - decrement;
    }
  }

  int decrementToLimit({int minLimit = 0, int step = 1}) {
    if (this - step < minLimit) {
      return minLimit;
    } else {
      return this - step;
    }
  }
}
