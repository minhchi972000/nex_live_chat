import 'package:nex_live_chat/app.dart';

import '../../widget/widget.dart';

class NexBottomSheet {
  static Future<dynamic> showNexBottomSheet({
    required Widget child,
    BoxConstraints? constraints,
    bool? showDragHandle,
    Clip? clipBehavior,
    bool isScrollControlled = false,
    double scrollControlDisabledMaxHeightRatio = 1,
    bool? useSafeArea,
    Color? backgroundColor,
  }) async {
    return await showModalBottomSheet<dynamic>(
      isScrollControlled: isScrollControlled,
      scrollControlDisabledMaxHeightRatio: scrollControlDisabledMaxHeightRatio,
      useSafeArea: useSafeArea ?? true,
      clipBehavior: clipBehavior,
      showDragHandle: showDragHandle,
      constraints: constraints ?? const BoxConstraints.expand(),
      backgroundColor: backgroundColor ?? Colors.transparent,
      context: App.appNavigateKey.currentContext!,
      builder: (context) => child,
    );
  }

  // Future<dynamic> showNexTitleMessageBottomSheet(Widget child) {
  //   return showModalBottomSheet<dynamic>(
  //     context: App.appNavigateKey.currentContext!,
  //     builder: (context) => WrapperDialog(
  //       child: ,
  //     ),
  //   );
  // }
}
