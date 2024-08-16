// ignore_for_file: public_member_api_docs, sort_constructors_first
 // ignore_for_file: must_be_immutable
import 'package:short_extensions/short_extensions.dart';


class SquareImgWidget extends StatelessWidget {
  final String img;
  final double size;
  final BoxFit fit;
  final Color? color;
  final VoidCallback? onTap;
  final double roundRadius;
  final Widget? child;

  final String errorImgPath;
  const SquareImgWidget({
    super.key,
    this.img = "",
    this.size = 50,
    this.fit = BoxFit.contain,
    this.color,
    this.onTap,
    this.roundRadius = 0,
    this.child,
    this.errorImgPath = "",
  });
  const SquareImgWidget.tap({
    Key? key,
    this.img = "",
    this.size = 50,
    this.fit = BoxFit.contain,
    this.color,
    this.child,
    required this.onTap,
    this.errorImgPath = "",
    this.roundRadius = 0,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return onTap != null
        ? InkWell(
            onTap: () {
              if (onTap != null) {
                onTap!();
              }
            },
            child: _child())
        : _child();
  }

  Widget _child() {
    return Stack(
      children: [
        Container(
          width: size,
          height: size,
          child: Image.asset(
            img,
            fit: fit,
            color: color,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                errorImgPath,
                fit: fit,
                color: color,
              );
            },
          ).clipRounded(radius: roundRadius),
        ).clipRounded(radius: roundRadius),
        if (child != null) child!,
      ],
    ).placeInContainer(size, size);
  }
}

class RectImgWidget extends StatelessWidget {
  final String img;
  final double w;
  final double h;
  final BoxFit fit;
  final double pad;
  final Widget? child;
  final VoidCallback? onTap;
  final double roundRadius;
  final Color? color;
  final String errorImgPath;

  const RectImgWidget({
    Key? key,
    required this.img,
    this.w = 50,
    this.h = 50,
    this.fit = BoxFit.contain,
    this.pad = 0,
    this.child,
    this.onTap,
    this.roundRadius = 0,
    this.color,
    this.errorImgPath = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return onTap == null
        ? _child()
        : InkWell(
            onTap: () {
              if (onTap != null) {
                onTap!();
              }
            },
            child: _child());
  }

  Widget _child() {
    return Container(
      width: w.abs(),
      height: h.abs(),
      constraints: BoxConstraints(maxHeight: h.abs(), maxWidth: w.abs()),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            img,
            fit: fit,
            color: color,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                errorImgPath,
                fit: fit,
                color: color,
              );
            },
          ).applyPadding(padding: pad),
          if (child != null) child!
        ],
      ).clipRounded(radius: roundRadius),
    );
  }
}
