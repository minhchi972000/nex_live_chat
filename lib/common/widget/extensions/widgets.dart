import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

extension WidgetExtension on Widget {
  // Expand
  Widget get fullWidth => SizedBox(width: double.maxFinite, child: this);
  Widget get fullHeight => SizedBox(height: double.maxFinite, child: this);

  Widget get full =>
      SizedBox(height: double.maxFinite, width: double.maxFinite, child: this);

  Widget wrapHeight(double amount) => SizedBox(height: amount, child: this);

  Widget wrapWidth(double amount) => SizedBox(width: amount, child: this);

  Widget wrapSize(double height, double width) =>
      SizedBox(width: width, height: height, child: this);

  Widget get wrapShimmer => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade50,
        child: this,
      );
}

extension DeviceScreen on BuildContext {
  MediaQueryData get mq => MediaQuery.of(this);

  double get sizeWidth => mq.size.width;

  bool get isSmallMobile => sizeWidth < 375;
}
