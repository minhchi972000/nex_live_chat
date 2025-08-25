import 'package:flutter_svg/svg.dart';
import 'package:nex_live_chat/common/widget/extensions/text_style_extension.dart';

import '../../theme/app_colors.dart';
import '../commons.dart';

class ChipFilter extends StatelessWidget {
  final String icon;
  final String iconSelected;
  final VoidCallback? onTap;
  final String title;
  final bool isSelected;
  final bool isLeadingIcon;
  const ChipFilter({
    super.key,
    required this.icon,
    required this.iconSelected,
    this.onTap,
    required this.title,
    this.isSelected = false,
    this.isLeadingIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: isSelected ? AppColors.colorF2F2F2 : AppColors.colorF4F5F7),
          color: isSelected ? Colors.white : AppColors.colorF4F5F7,
        ),
        child: Row(
          children: [
            if (isLeadingIcon) SvgPicture.asset(isSelected ? iconSelected : icon, height: 14).paddingOnly(right: 6),
            Text(title, style: textTheme.bodySmall!.medium.textColor(isSelected ? AppColors.black : AppColors.color9196A1)),
            if (!isLeadingIcon) SvgPicture.asset(isSelected ? iconSelected : icon, height: 14).paddingOnly(left: 6),
          ],
        ),
      ),
    );
  }
}
