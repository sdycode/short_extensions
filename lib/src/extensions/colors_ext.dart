import 'package:flutter/material.dart';

extension MaterialColorr on Color {
  WidgetStateColor materialColor() {
    return MaterialStateColor.resolveWith((states) => this);
  }

  percentColor([int op = 50]) {
    return withAlpha((op * 2.55).toInt());
  }

  Color mixWithColor(Color color, {double intensity = 0.6}) {
    return Color.lerp(color, this, intensity) ?? this;
  }
}
