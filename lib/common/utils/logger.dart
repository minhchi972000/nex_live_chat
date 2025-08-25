
import '../commons.dart';

class AppLog {
  static void debug(dynamic message, [String? from]) {
    debugPrint(
      '______________________________________\n🔨 ${from ?? ''}\nMESSAGE: $message\n______________________________________',
    );
  }

  static void info(dynamic message, [String? from]) {
    debugPrint(
      '______________________________________\n❕ ${from ?? ''}\nMESSAGE: $message\n______________________________________',
    );
  }

  static void warning(dynamic message, [String? from]) {
    debugPrint(
      '______________________________________\n❗ ${from ?? ''}\nMESSAGE: $message\n______________________________________',
    );
  }

  static void error(dynamic message, [String? from]) {
    debugPrint(
      '______________________________________\n❌ ${from ?? ''}\nMESSAGE: $message\n______________________________________',
    );
  }
}
