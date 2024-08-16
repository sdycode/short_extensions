import 'package:flutter/material.dart';
import 'package:short_extensions/short_extensions.dart';

// extension CapitaliseFirstLetter

extension OnString on String {
  DecorationImage decoImg({BoxFit? fit, double? opacity}) {
    return DecorationImage(
        image: AssetImage(this),
        fit: fit ?? BoxFit.fill,
        opacity: opacity ?? 1);
  }

  TextStyle fontTextStyle() {
    return TextStyle(fontFamily: this);
  }

  String convertStringToTitleCase() {
    List<String> words = split(' ');
    List<String> capitalizedWords = [];

    for (String word in words) {
      if (word.isNotEmpty) {
        String capitalizedWord = word[0].toUpperCase() + word.substring(1);
        capitalizedWords.add(capitalizedWord);
      }
    }

    return capitalizedWords.join(' ');
  }

  String capitalFirstLetterInString() {
    if (trim().isEmpty) {
      return this;
    }
    if (trim().length == 1) {
      return toUpperCase();
    }
    return this[0].toUpperCase() + substring(1);
  }

  Widget roundButtonExpanded(
      {Color? bgColor,
      required VoidCallback onTap,
      bool flex = true,
      Color? textColor,
      FontWeight? fontWeight,
      double? fontsize,
      double? horzPad,
      bool nonTappable = false,
      bool expanded = true,
      bool loading = false,
      Widget? rightIcon,
      Widget? leftIcon,
      double? vertPadding,
      int? maxLines}) {
    return SizedBox(
      width: expanded ? double.infinity : null,
      child: TextButton(
          onPressed: () {
            if (!loading) {
              onTap();
            }
          },
          style: ButtonStyle(
              backgroundColor: ((bgColor ?? const Color(0xff0988D1))
                      .withOpacity(loading ? 0.6 : 1))
                  .materialColor(),
              shape: MaterialStateProperty.all(const StadiumBorder())),
          child: loading
              ? const CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.white,
                ).applyVerticalPadding(padding: 8)
              : TextWidget(
                  text: this,
                  maxLines: maxLines ?? 1,
                  fontsize: fontsize ?? 18,
                  fontweight: fontWeight ?? FontWeight.w500,
                  color: textColor ?? Colors.white,
                ).applySymmetricPadding(
                  horizontal: horzPad ?? 4, vertical: vertPadding ?? 4)),
    );
  }

  Widget gradientButton({
    required VoidCallback onTap,
    Color? bgColor,
    bool flex = true,
    Color? textColor,
    double? fontsize,
    double? width,
    double vertPad = 12,
    double sidePad = 12,
    bool loading = false,
    Color splashColor = Colors.white,
    bool fullRoundButton = true,
    Color? borderColor,
    double opacity = 0.5,
    bool ignore = false,
    FontWeight fontWeight = FontWeight.w600,
    Gradient? gradient,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
            borderRadius: 12.circularBorder(), gradient: gradient),
        child: TextWidget(
          text: this,
          fontsize: fontsize ?? 24,
          fontweight: FontWeight.bold,
          color: textColor ?? Colors.white,
        ).applySymmetricPadding(horizontal: sidePad, vertical: vertPad),
      ),
    )
        .applyOpacityWithIgnore(ignore: ignore, opacity: opacity)
        .applySymmetricPadding(
          horizontal: sidePad,
        );
  }

  Widget elButton({
    required VoidCallback onTap,
    bool fullWidth = true,
    Color? bgColor,
    bool flex = true,
    Color? textColor,
    double? fontsize,
    double? width,
    double vertPad = 8,
    double inneerVertPad = 14,
    double sidePad = 8,
    double borderRadius = 12,
    bool loading = false,
    Color splashColor = Colors.white,
    bool fullRoundButton = false,
    Color? borderColor,
    double opacity = 0.5,
    bool ignore = false,
    EdgeInsetsGeometry? padding,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    bool useSplashColor = bgColor == Colors.black;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: sidePad, vertical: vertPad),
      width: fullWidth ? (width ?? double.infinity) : null,
      child: ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(padding),
                  overlayColor: !useSplashColor
                      ? null
                      : MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              // Splash color when button is pressed
                              return (Color.lerp(
                                          splashColor, Colors.black, 0.4) ??
                                      Colors.black)
                                  .withAlpha(
                                      150); // Change color and opacity as needed
                            }
                            // Splash color when button is not pressed
                            return (Colors.black).withAlpha(
                                50); //  Transparent splash color when button is not pressed
                          },
                        ),
                  shape: fullRoundButton
                      ? MaterialStateProperty.all(StadiumBorder(
                          side: BorderSide(
                              color: borderColor ?? Colors.transparent)))
                      : MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: borderRadius.circularBorder())),
                  foregroundColor:
                      ((textColor == null ? Colors.white : textColor)
                              .withOpacity(loading ? 0.6 : 1))
                          .materialColor(),
                  backgroundColor: (bgColor == null
                      ? Colors.blue.materialColor()
                      : bgColor.materialColor())),
              onPressed: () {
                onTap();
                // bool useSplashColor = bgColor == Colors.black;
                // printLog("elb $this, $useSplashColor");
              },
              child: loading
                  ? const CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.white,
                    ).applyVerticalPadding(padding: 8)
                  : Text(
                      this,
                      style: TextStyle(
                          fontSize: fontsize ?? 20, fontWeight: fontWeight),
                    ).applyVerticalPadding(padding: inneerVertPad))
          .applyOpacityWithIgnore(ignore: ignore, opacity: opacity),
    );
  }

  Widget borderedButton({
    required VoidCallback onTap,
    bool fullWidth = true,
    bool flex = true,
    double? fontsize,
    double? width,
    double vertPad = 8,
    double sidePad = 8,
    Color? overlayColor,
    Color? bgColor,
    Color? textColor,
    Color? borderColor,
    bool loading = false,
    double opacity = 0.5,
    bool ignore = false,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sidePad, vertical: vertPad),
      width: fullWidth ? (width ?? double.infinity) : null,
      child: TextButton(
        onPressed: onTap,
        style: ButtonStyle(
            overlayColor: overlayColor == null
                ? null
                : MaterialStateProperty.all(overlayColor.withAlpha(150)),
            backgroundColor: (bgColor ?? Colors.transparent).materialColor(),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: 8.circularBorder(),
                side: BorderSide(color: borderColor ?? Colors.blue)))),
        child: loading
            ? const CircularProgressIndicator.adaptive(
                backgroundColor: Colors.white,
              ).applyVerticalPadding(padding: 8)
            : TextWidget(
                text: this,
                fontsize: 24,
                fontweight: fontWeight,
                color: textColor ?? Colors.blue,
              ).applyVerticalPadding(padding: 4),
      ).applyOpacityWithIgnore(ignore: ignore, opacity: opacity),
    );
  }
}
