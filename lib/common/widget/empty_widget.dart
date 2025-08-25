import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nex_live_chat/common/widget/extensions/text_style_extension.dart';

import '../commons.dart';

class EmptyDataWidget extends StatelessWidget {
  final String? textEmpty;

  const EmptyDataWidget({super.key, this.textEmpty});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset('ic_empty_screen'.assetIconsPathSVG, width: 80, height: 80),
                10.verticalSpace,
                Text(textEmpty ?? 'No_data'.tr(), textAlign: TextAlign.center, style: textTheme.bodyMedium!.medium),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
