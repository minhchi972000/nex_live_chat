import 'package:flutter/material.dart';
import 'package:nex_live_chat/routers/nex_navigate.dart';
import 'package:nex_live_chat/theme/app_colors.dart';

class LeadingBackButton extends StatelessWidget {
  final VoidCallback? onBack;
  final Color? color;

  const LeadingBackButton({super.key, this.onBack, this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onBack ?? NexNavigate.pop,
      padding: EdgeInsets.zero,
      icon: Icon(Icons.arrow_back_ios, color: color ?? Colors.black, size: 20),
    );
  }
}

extension NexButton on Widget {
  FilledButton elevatedButton({
    required VoidCallback? onPressed,
    Color? bgColor,
    Color? colorTitle,
    double? radius,
    EdgeInsetsGeometry? padding,
    OutlinedBorder? shapeBorder,
    double? elevation,
  }) {
    return FilledButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: padding,
        shape: shapeBorder ?? RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius ?? 32)),
        foregroundColor: colorTitle ?? Colors.white,
        backgroundColor: bgColor ?? AppColors.primary,
        elevation: elevation ?? 1,
      ),
      child: this,
    );
  }

  OutlinedButton outLineButton({
    required VoidCallback? onPressed,
    Color? colorBorder,
    Color? bgColor,
    double? radius,
    double width = 1.0,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
    Size? size,
  }) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: padding,
        minimumSize: size,
        maximumSize: size,
        backgroundColor: bgColor ?? Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 32)),
        side: BorderSide(width: width, color: colorBorder ?? AppColors.colorGreyDAE0E6),
      ),
      onPressed: onPressed,
      child: this,
    );
  }

  TextButton textIconButton({
    required VoidCallback? onPressed,
    Color? color = Colors.transparent,
    EdgeInsetsGeometry? padding,
    double? radius,
  }) {
    return TextButton.icon(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: padding,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius ?? 32)),
        side: BorderSide(width: 1, color: color ?? AppColors.colorGreyDAE0E6),
      ),
      label: this,
    );
  }
}
