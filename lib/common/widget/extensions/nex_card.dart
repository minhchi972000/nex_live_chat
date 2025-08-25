import 'package:flutter/material.dart';
import 'package:nex_live_chat/theme/app_colors.dart';

class NexCard extends StatelessWidget {
  final Color? color;
  final double? radius;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget child;
  final VoidCallback? onTap;
  final BoxBorder? boxBorder;

  const NexCard({
    super.key,
    this.color,
    this.radius,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.onTap,
    required this.child,
    this.boxBorder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(color: color ?? Colors.black, borderRadius: BorderRadius.circular(radius ?? 0.0), border: boxBorder),
      child: GestureDetector(onTap: onTap, child: child),
    );
  }
}

extension NexWidgetExtension on Widget {
  Widget wrapCard({
    Color? color,
    double? radius,
    double? width,
    double? height,
    EdgeInsets? padding,
    EdgeInsets? margin,
    VoidCallback? onTap,
    BoxBorder? boxBorder,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: color ?? Colors.transparent,
          borderRadius: BorderRadius.circular(radius ?? 0.0),
          border: boxBorder,
        ),
        child: this,
      ),
    );
  }

  Widget wrapContainer({
    double radius = 10.0,
    Color? color,
    double? width,
    double? height,
    Color? colorBorder,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    AlignmentGeometry? alignment,
    BoxConstraints? constraints,
    double? widthBorder,
    Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        alignment: alignment,
        constraints: constraints,
        decoration: BoxDecoration(
          color: color,
          border: widthBorder == null ? null : Border.all(color: colorBorder ?? Colors.transparent, width: widthBorder),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: this,
      ),
    );
  }

  Widget wrapBorderRadius({
    double topLeft = 0.0,
    double topRight = 0.0,
    double bottomLeft = 0.0,
    double radiusAll = 0.0,
    double bottomRight = 0.0,
  }) {
    return ClipRRect(
      borderRadius: radiusAll != 0.0
          ? BorderRadius.circular(radiusAll)
          : BorderRadius.only(
              topLeft: Radius.circular(topLeft),
              topRight: Radius.circular(topRight),
              bottomLeft: Radius.circular(bottomLeft),
              bottomRight: Radius.circular(bottomRight),
            ),
      child: this,
    );
  }

  Widget wrapCards({Color? color, double? radius, double? width, double? height, double? elevation}) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: elevation ?? 1,
      child: this,
    );
  }

  Widget wrapContainerShadow({
    double radius = 10.0,
    Color? color,
    double? width,
    double? height,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BoxShadow? shadow,
  }) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      constraints: constraints,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(width: 1.5, color: AppColors.colorF6F6F6),
        boxShadow: [shadow ?? BoxShadow(spreadRadius: 1, blurRadius: 8, offset: const Offset(0, 5), color: Colors.grey.shade50)],
        borderRadius: BorderRadius.circular(radius),
      ),
      child: this,
    );
  }
}
