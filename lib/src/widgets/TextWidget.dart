// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

double get defaultFontSize => 20;

class TextWidget extends StatelessWidget {
  final String text;
  final double? fontsize;
  final FontWeight fontweight;
  final Color color;
  final TextAlign align;
  final int maxLines;
  TextOverflow? overflow;
  TextStyle? font;
  String? fontFamily;
  bool? useGoogleFont;
  final bool? isUnderlined;
  bool? primary;
  FontStyle? fontStyle;
  TextWidget(
      {super.key,
      required this.text,
      this.maxLines = 1,
      this.fontsize,
      this.fontweight = FontWeight.normal,
      this.overflow = TextOverflow.visible,
      this.font,
      this.isUnderlined,
      this.color = Colors.black,
      this.align = TextAlign.center,
      this.fontFamily,
      this.useGoogleFont = true,
      this.fontStyle = FontStyle.normal});

  TextWidget.black(
      {super.key,
      required this.text,
      this.maxLines = 1,
      this.fontsize,
      this.fontweight = FontWeight.normal,
      this.font,
      this.isUnderlined,
      this.color = Colors.black,
      this.align = TextAlign.center,
      this.fontStyle = FontStyle.normal,
      this.useGoogleFont = true,
      this.fontFamily});
  TextWidget.primary(
      {super.key,
      required this.text,
      this.maxLines = 1,
      this.fontsize,
      this.fontweight = FontWeight.normal,
      this.font,
      this.isUnderlined,
      this.color = Colors.blue,
      this.useGoogleFont = true,
      this.align = TextAlign.center,
      this.fontStyle = FontStyle.normal,
      this.fontFamily});
  TextWidget.white(
      {super.key,
      required this.text,
      this.maxLines = 1,
      this.useGoogleFont = true,
      this.fontsize,
      this.fontweight = FontWeight.normal,
      this.font,
      this.isUnderlined,
      this.color = Colors.white,
      this.fontStyle = FontStyle.normal,
      this.align = TextAlign.center,
      this.fontFamily});
  @override
  Widget build(BuildContext context) {
    TextStyle newfont =
        font ?? TextStyle(fontStyle: fontStyle, fontWeight: fontweight);

    if (fontFamily != null) {
      font = TextStyle(fontFamily: fontFamily, fontStyle: fontStyle);
    }
    if (useGoogleFont != null && useGoogleFont == true) {
    } else {
      if (fontFamily != null) {
        font = TextStyle(fontFamily: fontFamily, fontStyle: fontStyle);
      } else {
        // font = TextStyle(fontFamily: Fonts.Blair);
      }
    }
    return Text(text,
        textAlign: align,
        maxLines: maxLines,
        style: font == null
            ? TextStyle(
                overflow: overflow,
                color: primary != null ? Colors.blue : color,
                fontSize: fontsize ?? defaultFontSize,
                fontStyle: fontStyle,
                decoration:
                    isUnderlined == null ? null : TextDecoration.underline,
                fontWeight: fontweight)
            : newfont.copyWith(
                overflow: overflow,
                fontStyle: fontStyle,
                color: primary != null ? Colors.blue : color,
                decoration:
                    isUnderlined == null ? null : TextDecoration.underline,
                fontSize: fontsize ?? defaultFontSize,
                fontWeight: fontweight));
  }
}
