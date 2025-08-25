import 'package:shimmer/shimmer.dart';

import '../commons.dart';

class ShimmerWidget extends StatelessWidget {
  final ScrollController? scrollController;
  final ShimmerTypeEnum type;
  final SettingShimmer? settingShimmer;
  final Widget? child;
  const ShimmerWidget(
      {super.key, required this.type, this.settingShimmer, this.child, this.scrollController});

  @override
  Widget build(BuildContext context) {
    late Widget childWidget;
    switch (type) {
      case ShimmerTypeEnum.listView:
        childWidget = _buildListView();
        break;
      default:
        childWidget = child ?? const SizedBox();
        break;
    }
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade50,
      child: childWidget,
    );
  }

  Widget _buildListView() {
    final setting = settingShimmer as SettingShimmerListView;
    var scrollAxis = setting.scrollAxis ?? Axis.vertical;
    return ListView.separated(
      controller: scrollController,
      padding: setting.padding,
      shrinkWrap: setting.shrinkWrap ?? true,
      scrollDirection: scrollAxis,
      physics: setting.physics,
      itemBuilder: (_, __) =>
          setting.item ??
          Container(
            width: setting.itemWidth ?? double.infinity,
            height: setting.itemHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(setting.radius ?? 10),
              color: Colors.white,
            ),
          ),
      separatorBuilder: (_, __) => scrollAxis == Axis.vertical
          ? setting.itemSpacing.verticalSpace
          : setting.itemSpacing.horizontalSpace,
      itemCount: setting.count,
    );
  }
}

abstract class SettingShimmer {
  final int count;

  SettingShimmer({required this.count});
}

class SettingShimmerListView extends SettingShimmer {
  SettingShimmerListView({
    required super.count,
    this.padding,
    required this.itemHeight,
    required this.itemSpacing,
    this.radius,
    this.itemWidth,
    this.shrinkWrap,
    this.physics,
    this.item,
    this.scrollAxis,
  });

  final EdgeInsetsGeometry? padding;
  final double itemHeight;
  final double? itemWidth;
  final double itemSpacing;
  final double? radius;
  final bool? shrinkWrap;
  final ScrollPhysics? physics;
  final Widget? item;
  final Axis? scrollAxis;
}

enum ShimmerTypeEnum { listView, custom, item }
