import 'dart:async';

import 'package:nex_live_chat/common/widget/extensions/nex_button.dart';
import 'package:nex_live_chat/common/widget/extensions/text_style_extension.dart';

import '../commons.dart';

class ButtonCountdown extends StatefulWidget {
  final DateTime? dateTime;
  final int minute;
  final String title;
  final VoidCallback? onTap;
  final VoidCallback? onEnd;
  const ButtonCountdown({super.key, this.dateTime, required this.minute, required this.title, this.onTap, this.onEnd});

  @override
  State<ButtonCountdown> createState() => _ButtonCountdownState();
}

class _ButtonCountdownState extends State<ButtonCountdown> {
  Timer? _timer;
  String _timeLeft = "";

  @override
  void initState() {
    super.initState();
    if (widget.dateTime != null) {
      _startCountdown();
    }
  }

  @override
  void didUpdateWidget(covariant ButtonCountdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.dateTime?.millisecondsSinceEpoch != oldWidget.dateTime?.millisecondsSinceEpoch) {
      if (widget.dateTime != null) {
        _startCountdown();
      }
    }
  }

  void _startCountdown() {
    _timeLeft = _countdownTimer();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _timeLeft = _countdownTimer();
        if (_timeLeft == "00:00") {
          _timeLeft = '';
          _timer?.cancel();
          widget.onEnd?.call();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _timeLeft.isNotEmpty ? _timeLeft : widget.title,
      style: textTheme.labelLarge?.textColor(Colors.white),
    ).elevatedButton(onPressed: _timeLeft.isNotEmpty ? null : widget.onTap);
  }

  String _countdownTimer() {
    DateTime endTime = widget.dateTime!.add(Duration(minutes: widget.minute));
    DateTime currentTime = DateTime.now();
    Duration remainingTime = endTime.difference(currentTime);
    if (remainingTime.isNegative) {
      return "00:00";
    }
    String minutes = remainingTime.inMinutes.remainder(60).toString().padLeft(2, '0');
    String seconds = remainingTime.inSeconds.remainder(60).toString().padLeft(2, '0');

    return "$minutes:$seconds";
  }
}
