import 'package:nex_live_chat/common/widget/extensions/text_style_extension.dart';

import '../commons.dart';

class ContainerTextTotal extends StatelessWidget {
  final String title;
  final num total;

  const ContainerTextTotal({super.key, required this.title, required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(child: Text(title, style: textTheme.bodyMedium!.medium)),
        5.horizontalSpace,
        Container(
          width: 100,
          alignment: Alignment.centerRight,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(total.formatCurrency, textAlign: TextAlign.end, style: textTheme.bodyLarge!.bold.textPrimary),
          ),
        ),
      ],
    );
  }
}
