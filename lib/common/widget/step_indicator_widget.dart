import 'package:flutter/material.dart';

class StepIndicatorWidget extends StatefulWidget {
  final int totalStep;
  final int indexStep;
  final double? widthItem;
  final Color selectedColor;
  final Color unSelectedColor;
  final Function(int)? callback;

  const StepIndicatorWidget({
    super.key,
    required this.totalStep,
    required this.indexStep,
    this.widthItem,
    this.selectedColor = Colors.white,
    this.unSelectedColor = Colors.red,
    this.callback,
  });

  @override
  State<StepIndicatorWidget> createState() => StepIndicatorWidgetState();
}

class StepIndicatorWidgetState extends State<StepIndicatorWidget> {
  late int _indexStep;

  @override
  void initState() {
    super.initState();
    _indexStep = widget.indexStep;
  }

  @override
  void didUpdateWidget(covariant StepIndicatorWidget oldWidget) {
    // 
    super.didUpdateWidget(oldWidget);
    setState(() {
      _indexStep = widget.indexStep;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildIndicator();
  }

  Widget _buildIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // color: widget.showBorder
        //     ? Style.colorGreyF2F2F2.withValues(alpha:0.5)
        //     : Colors.transparent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(widget.totalStep, (index) => _buildItemIndicator(_indexStep == index)),
      ),
    );
  }

  Widget _buildItemIndicator(bool isFocus) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: isFocus ? widget.widthItem ?? 25 : 5,
      height: 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: isFocus ? widget.selectedColor : widget.unSelectedColor,
      ),
    );
  }

  void updateStep(int step) {
    setState(() {
      _indexStep = step;
    });
    widget.callback?.call(_indexStep);
  }
}
