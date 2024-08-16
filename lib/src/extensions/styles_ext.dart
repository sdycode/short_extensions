import 'package:flutter/material.dart';
import 'package:short_extensions/src/extensions/size_extensions.dart';

extension ShapeStyles on num {
  ShapeBorder roundedCardShape() =>
      RoundedRectangleBorder(borderRadius: circularBorder());
  // ShapeBorder cardRoundShape() => RoundedRectangleBorder(borderRadius: circularBorder());
}
