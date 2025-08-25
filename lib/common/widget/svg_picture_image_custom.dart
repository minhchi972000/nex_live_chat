import 'package:flutter_svg/svg.dart';
import 'package:nex_live_chat/common/commons.dart';

///[color]: color old ===> colorFilter with BlendMode
class SvgPictureImageCustom extends StatelessWidget {
  const SvgPictureImageCustom({
    super.key,
    required this.svgPath,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.color,
    this.blendMode,
    this.type = TypeSvg.asset,
    this.placeholderBuilder,
  });

  final String svgPath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final Color? color;
  final BlendMode? blendMode;
  final TypeSvg type;
  // final Function(BuildContext)? placeholderBuilder;
  final WidgetBuilder? placeholderBuilder;

  @override
  Widget build(BuildContext context) {
    if (type == TypeSvg.network) {
      return SvgPicture.network(
        svgPath,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        colorFilter: color != null ? ColorFilter.mode(color!, blendMode ?? BlendMode.srcIn) : null,
        placeholderBuilder:
            placeholderBuilder ?? (context) => const SizedBox(height: 16, width: 16, child: CircularProgressIndicator(strokeWidth: 1.5)),
        // placeholderBuilder: placeholderBuilder != null
        //     ? placeholderBuilder!(context)
        //     : SizedBox(
        //         height: 16,
        //         width: 16,
        //         child: CircularProgressIndicator(strokeWidth: 1.5),
        //       ),
      );
    }

    return SvgPicture.asset(
      svgPath.assetIconsPathSVG,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      colorFilter: color != null ? ColorFilter.mode(color!, blendMode ?? BlendMode.srcIn) : null,
    );
  }
}

enum TypeSvg { network, asset }
