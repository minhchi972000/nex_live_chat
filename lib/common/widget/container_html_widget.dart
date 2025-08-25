import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:nex_live_chat/common/widget/extensions/text_style_extension.dart';

import '../commons.dart';

class ContainerHtmlWidget extends StatelessWidget {
  final TextStyle? textStyle;
  final String html;
  final RenderMode viewMode;
  const ContainerHtmlWidget({super.key, this.textStyle, required this.html, this.viewMode = RenderMode.listView});

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      html,
      // onTapUrl: (url) => print('tapped $url'),
      renderMode: viewMode,
      textStyle: textStyle ?? textTheme.bodyMedium!.medium,
    );
  }
}
