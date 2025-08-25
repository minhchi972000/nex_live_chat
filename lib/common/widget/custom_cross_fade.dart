import '../commons.dart';

class CustomCrossFade extends StatelessWidget {
  final Widget secondChild;
  final Widget firstChild;
  final bool isShowFirst;
  final EdgeInsets? padding;
  final bool useCenter;
  final int duration;

  const CustomCrossFade({
    super.key,
    required this.isShowFirst,
    required this.firstChild,
    required this.secondChild,
    this.padding,
    this.useCenter = true,
    this.duration = 500,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: AnimatedCrossFade(
        firstChild: firstChild,
        secondChild: childX(),
        duration: Duration(milliseconds: duration),
        firstCurve: Curves.easeInOut,
        secondCurve: Curves.easeInOut,
        crossFadeState: isShowFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      ),
    );
  }

  Widget childX() {
    if (useCenter) return Center(child: secondChild);
    return secondChild;
  }
}
