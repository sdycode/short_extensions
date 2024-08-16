import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';

extension ContextUtils on BuildContext {
  double computeMaxBottomInset() {
    MediaQueryData mqData = MediaQuery.of(this);
    return max(max(mqData.viewInsets.bottom, mqData.viewPadding.bottom),
        mqData.padding.bottom);
  }

  bool isKeyboardVisible() {
    return (Platform.isIOS
            ? MediaQuery.of(this).viewInsets.bottom
            : MediaQuery.of(this).viewInsets.bottom) >
        0;
  }

  Widget generateTopPadding() {
    return SizedBox(
      height: Platform.isIOS
          ? MediaQuery.of(this).padding.top
          : MediaQuery.of(this).viewPadding.top,
    );
  }

  Widget horizontalNotchInset() {
    return SizedBox(
      height: Platform.isIOS
          ? max(MediaQuery.of(this).padding.left,
              MediaQuery.of(this).padding.right)
          : max(MediaQuery.of(this).viewPadding.left,
              MediaQuery.of(this).viewPadding.right),
    );
  }

  EdgeInsets getNotchInsets() {
    return EdgeInsets.only(
        top: Platform.isIOS
            ? MediaQuery.of(this).viewPadding.top
            : MediaQuery.of(this).padding.top);
  }

  double calculateSideNotchInset() {
    return Platform.isIOS
        ? max(MediaQuery.of(this).viewPadding.left,
            MediaQuery.of(this).viewPadding.right)
        : 0;
  }

  double sideInsetValue({required bool isLeft}) {
    return Platform.isIOS
        ? isLeft
            ? MediaQuery.of(this).viewPadding.left
            : MediaQuery.of(this).viewPadding.right
        : isLeft
            ? MediaQuery.of(this).padding.left
            : MediaQuery.of(this).padding.right;
  }

  double computeTopInset() {
    return Platform.isIOS
        ? MediaQuery.of(this).padding.top
        : MediaQuery.of(this).viewPadding.top;
  }

  double fetchStatusBarHeight() {
    return Platform.isIOS
        ? MediaQuery.of(this).padding.top
        : MediaQuery.of(this).viewPadding.top;
  }

  double calculateKeyboardHeight() {
    return (Platform.isIOS
        ? MediaQuery.of(this).viewInsets.bottom
        : MediaQuery.of(this).viewInsets.bottom);
  }

  SizedBox createKeyboardSpacing() {
    return SizedBox(
      height: (Platform.isIOS
          ? MediaQuery.of(this).viewInsets.bottom
          : MediaQuery.of(this).viewInsets.bottom),
    );
  }
}
