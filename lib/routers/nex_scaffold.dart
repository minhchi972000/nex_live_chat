import 'package:nex_live_chat/common/widget/extensions/nex_button.dart';
import 'package:nex_live_chat/common/widget/extensions/text_style_extension.dart';
import 'package:nex_live_chat/theme/app_colors.dart';

import '../common/commons.dart';

class NexScaffold extends StatelessWidget {
  final double? leadingWidth;
  final Widget child;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool showBackButton;
  final bool showAppBar;
  final Color? backgroundColor;
  final Color? backgroundColorAppBar;
  final Color? colorTextTitle;
  final Color? colorLeading;
  final List<Widget>? actions;
  final VoidCallback? onBack;
  final String? title;
  final double? elevation;
  final bool extendBody;
  final Widget? customTitle;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final NextSafeArea? nextSafeArea;

  const NexScaffold({
    super.key,
    required this.child,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.backgroundColor,
    this.showBackButton = true,
    this.showAppBar = false,
    this.actions,
    this.onBack,
    this.title,
    this.leadingWidth,
    this.backgroundColorAppBar,
    this.colorTextTitle,
    this.elevation,
    this.colorLeading,
    this.extendBody = false,
    this.customTitle,
    this.bottom,
    this.flexibleSpace,
    this.nextSafeArea,
  });

  void _hideKeyboard(BuildContext context) {
    if (FocusManager.instance.primaryFocus?.hasFocus ?? false) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      extendBody: extendBody,
      appBar: showAppBar == true
          ? AppBar(
              leadingWidth: leadingWidth ?? 56,
              flexibleSpace: flexibleSpace,
              backgroundColor: backgroundColorAppBar ?? Colors.white,
              scrolledUnderElevation: 0,
              leading: showBackButton
                  ? Center(
                      child: LeadingBackButton(color: colorLeading, onBack: onBack),
                    )
                  : const SizedBox.shrink(),
              title: customTitle ?? Text(title ?? '', style: textTheme.bodyMedium?.size(20).textColor(colorTextTitle ?? AppColors.black)),
              centerTitle: true,
              actions: actions,
              elevation: elevation ?? 3,
              bottom: bottom,
            )
          : null,
      bottomNavigationBar: bottomNavigationBar,
      // resizeToAvoidBottomInset:
      // _getChildScaffold?.resizeToAvoidBottomInset ?? false,
      // extendBodyBehindAppBar:
      // _getChildScaffold?.extendBodyBehindAppBar ?? true,
      // extendBody: true,
      body: _child(context),

      floatingActionButton: floatingActionButton,
    );
  }

  Widget _child(BuildContext context) {
    return SafeArea(
      top: nextSafeArea?.top ?? false,
      bottom: nextSafeArea?.bottom ?? true,
      right: nextSafeArea?.right ?? false,
      left: nextSafeArea?.left ?? false,
      child: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    if (child is Scaffold) {
      final Scaffold childScaffold = child as Scaffold;
      if (childScaffold.body != null) {
        return GestureDetector(
          onTap: () {
            _hideKeyboard(context);
          },
          child: childScaffold.body,
        );
      }
    }
    return GestureDetector(
      onTap: () {
        _hideKeyboard(context);
      },
      child: child,
    );
  }
}

class NextSafeArea {
  final bool top;
  final bool left;
  final bool right;
  final bool bottom;
  final EdgeInsets minimum;
  final bool maintainBottomViewPadding;

  const NextSafeArea({
    this.top = false,
    this.left = false,
    this.right = false,
    this.bottom = true,
    this.maintainBottomViewPadding = false,
    this.minimum = EdgeInsets.zero,
  });
}
