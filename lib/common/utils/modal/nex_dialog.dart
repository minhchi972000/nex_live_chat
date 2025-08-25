import 'package:flutter/material.dart';

import 'package:nex_live_chat/app.dart';
import 'package:nex_live_chat/common/utils/modal/dialog_widget.dart';

class NexDialog {
  static Future<dynamic> showNexDialogCustom({required Widget child, Color? colorDialog}) {
    return showDialog<dynamic>(
      context: App.appNavigateKey.currentContext!,
      builder: (context) => WrapperDialog(color: colorDialog, child: child),
    );
  }

  static Future<dynamic> showNexDialogTitleMessage({
    required String title,
    required String message,
    String? titleBtn,
    bool? isShowButton,
    VoidCallback? onTapButton,
    bool barrierDismissible = true,
  }) {
    return showDialog<dynamic>(
      context: App.appNavigateKey.currentContext!,
      barrierDismissible: barrierDismissible,
      builder: (context) => WrapperDialog(
        child: DialogTitleMessage(
          messages: message,
          title: title,
          isShowButton: isShowButton ?? true,
          onTapButton: onTapButton,
          titleBt: titleBtn,
        ),
      ),
    );
  }

  static Future<dynamic> showNexDialogAction(
    String title,
    String message,
    String titleLeftAction,
    String? titleRightAction,
    VoidCallback? onTapLeft,
    VoidCallback? onTapRight, {
    bool? barrierDismissible = true,
  }) {
    return showDialog<dynamic>(
      barrierDismissible: barrierDismissible ?? true,

      context: App.appNavigateKey.currentContext!,
      builder: (context) => WrapperDialog(
        child: DialogAction(
          messages: message,

          title: title,
          onTapRight: onTapRight,
          titleLeftAction: titleLeftAction,
          titleRightAction: titleRightAction,
          onTapLeft: onTapLeft,
        ),
      ),
    );
  }
}

class WrapperDialog extends StatelessWidget {
  const WrapperDialog({super.key, required this.child, this.color});

  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      insetPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      backgroundColor: color ?? Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: child,
    );
  }
}
