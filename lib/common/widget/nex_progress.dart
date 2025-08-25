import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';

class NexProgress {
  factory NexProgress() => _instance;
  static final NexProgress _instance = NexProgress._internal();
  static bool _isShowing = false;
  NexProgress._internal();

  static void show() {
    if (_isShowing) {
      SVProgressHUD.dismiss();
    }

    Future.delayed(const Duration(milliseconds: 50), () {
      SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black);
      SVProgressHUD.show();
      _isShowing = true;
    });
  }

  static void dismiss() {
    SVProgressHUD.dismiss();
    _isShowing = false;
  }

  static Future<void> showWithDelay({int milliseconds = 100}) async {
    await Future.delayed(Duration(milliseconds: milliseconds));
    show();
  }
}
