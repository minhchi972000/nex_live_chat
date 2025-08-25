import 'package:easy_localization/easy_localization.dart';
import 'package:nex_live_chat/common/widget/extensions/nex_button.dart';
import 'package:nex_live_chat/common/widget/extensions/text_style_extension.dart';
import 'package:nex_live_chat/routers/nex_navigate.dart';

import '../../commons.dart';

class DialogTitleMessage extends StatelessWidget {
  final String messages;
  final String title;
  final String? titleBt;
  final bool? isShowButton;
  final VoidCallback? onTapButton;

  const DialogTitleMessage({super.key, required this.messages, required this.title, this.titleBt, this.isShowButton, this.onTapButton});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: textTheme.bodyLarge?.size(20), textAlign: TextAlign.center),
            10.verticalSpace,
            Text(messages, style: textTheme.labelMedium!.text9196A1.size(14)),
            10.verticalSpace,

            if (isShowButton == true)
              SizedBox(
                width: 200,
                child: Text(
                  titleBt ?? 'OK',
                  style: textTheme.bodyMedium!.textWhite,
                ).elevatedButton(onPressed: onTapButton ?? NexNavigate.pop),
              ),
          ],
        ),
      ),
    );
  }
}

class DialogTitleWidget extends StatelessWidget {
  final Widget child;
  final String title;
  final String? titleBt;
  final VoidCallback? onTapButton;

  const DialogTitleWidget({super.key, required this.child, required this.title, this.titleBt, this.onTapButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: textTheme.bodyLarge?.size(20), textAlign: TextAlign.center),
          10.verticalSpace,
          child,
          10.verticalSpace,
          SizedBox(
            width: 150,
            child: Text(titleBt ?? 'OK', style: textTheme.bodyMedium!.textWhite).elevatedButton(onPressed: onTapButton ?? NexNavigate.pop),
          ),
        ],
      ),
    );
  }
}

class DialogAction extends StatelessWidget {
  final String messages;
  final String title;
  final String? titleLeftAction;
  final String? titleRightAction;
  final VoidCallback? onTapRight;
  final VoidCallback? onTapLeft;

  const DialogAction({
    super.key,
    required this.messages,
    required this.title,
    this.titleLeftAction,
    this.titleRightAction,
    this.onTapRight,
    this.onTapLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: textTheme.bodyLarge, textAlign: TextAlign.center),
          20.verticalSpace,
          Text(messages, style: textTheme.labelMedium!.text9196A1),
          35.verticalSpace,
          Row(
            children: [
              Expanded(
                child: Text(titleLeftAction ?? 'Cancle'.tr(), style: textTheme.bodyMedium!.textPrimary).outLineButton(onPressed: onTapLeft),
              ),
              10.horizontalSpace,
              Expanded(
                child: Text(titleRightAction ?? 'OK', style: textTheme.bodyMedium!.textWhite).elevatedButton(onPressed: onTapRight),
              ),
            ],
          ).paddingSymmetric(horizontal: 10),
        ],
      ),
    );
  }
}
