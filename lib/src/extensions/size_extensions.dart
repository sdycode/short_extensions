import 'package:flutter/material.dart';

extension BoxExtensions on num {
  SizedBox verticalSpacing() {
    // SizedBox vertBox()
    return SizedBox(
      height: toDouble(),
    );
  }

  SizedBox horizontalSpacing() {
    // SizedBox horzBox()
    return SizedBox(
      width: toDouble(),
    );
  }

  Container horizontalDivider({Color color = Colors.grey}) {
    // Container horzLine({Color color = Colors.grey})
    return Container(
      width: toDouble(),
      margin: EdgeInsets.symmetric(vertical: 8),
      height: 2,
      color: color,
    );
  }

  BorderRadius circularBorder() {
    // BorderRadius circularBorder()
    return BorderRadius.circular(toDouble());
  }

  Container roundedContainer({double? width = 12, Color? color}) {
    // Container roundContainerWidget({double? width = 12, Color? color})
    return Container(
      width: width ?? toDouble(),
      height: toDouble(),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: width == null
            ? toDouble().circularBorder()
            : (width * 0.5).circularBorder(),
      ),
    );
  }

  Spacer flexibleSpacer() {
    // Spacer spacer()
    return Spacer(
      flex: toInt(),
    );
  }
}
