import 'package:short_extensions/short_extensions.dart';
import 'package:short_extensions/src/extensions/size_extensions.dart';

extension WidgetEnhancer on Widget {
  Widget expandIfNeeded({bool shouldExpand = true, int flexFactor = 1}) {
    // Widget expnd({bool isExpand = true, int flex = 1})
    return shouldExpand
        ? Expanded(
            flex: flexFactor,
            child: this,
          )
        : this;
  }

  Widget alignLeft() {
    // Widget leftAlignWidget()
    return Align(
      alignment: Alignment.centerLeft,
      child: this,
    );
  }

  Widget alignRight() {
    // Widget rightAlignWidget()
    return Align(
      alignment: Alignment.centerRight,
      child: this,
    );
  }

  Widget horizontalScrollable({bool isScrollable = true}) {
    // Widget scrollRowWidget({bool scroll = true})
    return isScrollable
        ? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: this,
          )
        : this;
  }

  Widget verticalScrollable(
      {bool isScrollable = true, ScrollController? controller}) {
    // Widget scrollColumnWidget({bool scroll = true, ScrollController? scrollController})
    return isScrollable
        ? SingleChildScrollView(
            controller: controller,
            scrollDirection: Axis.vertical,
            child: this,
          )
        : this;
  }

  Widget clipRounded({double radius = 12}) {
    // Widget clipRoundToWidget({double rad = 12})
    return ClipRRect(
      borderRadius: radius.circularBorder(),
      child: this,
    );
  }

  Widget alignTopRight() {
    // Widget toprightAlignWidget()
    return Align(
      alignment: Alignment.topRight,
      child: this,
    );
  }

  Widget alignBottomLeft() {
    // Widget bottomLeftAlignWidget()
    return Align(
      alignment: Alignment.bottomLeft,
      child: this,
    );
  }

  Widget alignCenter() {
    // Widget alignCenterWidget()
    return Align(
      alignment: Alignment.center,
      child: this,
    );
  }

  Widget applyScale({double scale = 1.2}) {
    // Widget scaleWidget({double? s = 1.2})
    return Transform.scale(
      scale: scale,
      child: this,
    );
  }

  Widget scaleXY({double xScale = 1, double yScale = 1}) {
    // Widget scaleXYWidget({double x = 1, double y = 1})
    return Transform.scale(
      scaleX: xScale,
      scaleY: yScale,
      child: this,
    );
  }

  Widget addBulletPoint({Color? bulletColor}) {
    // Widget addBulletWidget({Color? color})
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 4,
          backgroundColor: bulletColor ?? Colors.white,
        ).applyPadding(padding: 12),
        Expanded(child: this)
      ],
    );
  }

  Widget constrainMaxWidth(double maxWidth) {
    // Widget maxWidthForWidget(double maxW)
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: maxWidth,
      ),
      child: this,
    );
  }

  Widget constrainMaxHeight(double maxHeight) {
    // Widget maxHeightForWidget(double maxH)
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: maxHeight,
      ),
      child: this,
    );
  }

  Widget constrainMinWidth(double minWidth) {
    // Widget minWidthForWidget(double minW)
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: minWidth,
      ),
      child: this,
    );
  }

  Widget constrainMinHeight(double minHeight) {
    // Widget minHForWidget(double mihH)
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: minHeight,
      ),
      child: this,
    );
  }

  Widget constrainHeightRange(double minHeight, double maxHeight) {
    // Widget minmaxHeightForWidget(double minH, double maxH)
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: minHeight,
        maxHeight: maxHeight,
      ),
      child: this,
    );
  }

  Widget constrainFixedWidth(double width) {
    // Widget widthOfWidget(double maxW)
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: width, minWidth: width),
      child: this,
    );
  }

  Widget constrainFixedHeight(double height) {
    // Widget heightOfWidget(double hei)
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: height, maxHeight: height),
      child: this,
    );
  }

  Widget placeInContainer(double width, double height, {Alignment? align}) {
    // Widget boxAroundWidget(double w, double h, {Alignment? alignment})
    return Container(
      width: width.abs(),
      height: height.abs(),
      alignment: align ?? Alignment.center,
      child: this,
    );
  }

  Widget applyTopPadding({double padding = 8}) {
    // Widget topPadding({double pad = 8})
    return Padding(
      padding: EdgeInsets.only(top: padding),
      child: this,
    );
  }

  Widget applyTopNotchPadding(BuildContext context) {
    // Widget topNotchPadding(BuildContext context)
    return Padding(
      padding: context.getNotchInsets(),
      child: this,
    );
  }

  Widget applyBottomKeyboardPadding(BuildContext context) {
    // Widget bottomKeyboardPadding(BuildContext context)
    return Padding(
      padding: EdgeInsets.only(bottom: context.computeMaxBottomInset()),
      child: this,
    );
  }

  Widget applyPadding({double padding = 8}) {
    // Widget paddingWidget({double pad = 8})
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }

  Widget applyVerticalPadding({double padding = 8}) {
    // Widget verticalPadding({double pad = 8})
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: this,
    );
  }

  Widget applyBottomPadding({double padding = 8}) {
    // Widget bottomPadding({double pad = 8})
    return Padding(
      padding: EdgeInsets.only(bottom: padding),
      child: this,
    );
  }

  Widget applyLeftPadding({double padding = 8}) {
    // Widget applyLeftPadding({double pad = 8})
    return Padding(
      padding: EdgeInsets.only(left: padding),
      child: this,
    );
  }

  Widget applyRightPadding({double padding = 8}) {
    // Widget rightPadding({double pad = 8})
    return Padding(
      padding: EdgeInsets.only(right: padding),
      child: this,
    );
  }

  Widget applySymmetricPadding({double horizontal = 12, double vertical = 8}) {
    // Widget symmetricPadding({double horz = 12, double vert = 8})
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }

  Widget applyHorizontalPadding({double horizontal = 12, double vertical = 0}) {
    // Widget horzPadding({double horz = 12, double vert = 0})
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }

  Widget applyLeftRightPadding({double left = 0, double right = 0}) {
    // Widget onlyLeftRightPadding({double left = 0, double right = 0})
    return Padding(
      padding: EdgeInsets.only(left: left, right: right),
      child: this,
    );
  }

  Widget applyVerticalOnlyPadding({double vertical = 8}) {
    // Widget vertPadding({double vert = 8})
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: vertical),
      child: this,
    );
  }

  Widget applyMinimalVerticalPadding_4({double vertical = 4}) {
    // Widget vertPad4({double vert = 4})
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: vertical),
      child: this,
    );
  }

  Widget disableInteraction({bool disable = true}) {
    // Widget ignoreWidget({bool ignore = true})
    return IgnorePointer(
      ignoring: disable,
      child: this,
    );
  }

  Widget setOpacity({double value = 1}) {
    // Widget withOpacity({double opacityValue = 1})
    return Opacity(
      opacity: value,
      child: this,
    );
  }

  Widget applyOpacityWithIgnore({double opacity = 0.5, bool ignore = true}) {
    // Widget opaqueWithIgnore({double opacityValue = 0.5, bool ignore = true})
    return disableInteraction(disable: ignore)
        .setOpacity(value: ignore ? opacity : 1);
  }

  Widget hideCompletely({bool hide = true}) {
    // Widget hideWidget({bool hide = true})
    return Opacity(
      opacity: hide ? 0 : 1,
      child: this,
    );
  }
}
