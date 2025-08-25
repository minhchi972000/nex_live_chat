import 'package:nex_live_chat/common/widget/extensions/text_style_extension.dart';

import '../commons.dart';

class ContainerHeader extends StatelessWidget {
  const ContainerHeader({super.key, this.action, required this.title, this.padding, this.titleWidget});

  final Widget? action;
  final String title;
  final Widget? titleWidget;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Row(
        children: [
          Image.asset('logo_nex'.assetImagesPathPNG, width: 40.82, height: 44),
          Expanded(
            child: titleWidget ?? Center(child: Text(title, style: textTheme.titleLarge!.bold.size(20)).paddingSymmetric(horizontal: 16)),
          ),
          action ?? const SizedBox(width: 40, height: 40),
        ],
      ),
    );
  }
}
