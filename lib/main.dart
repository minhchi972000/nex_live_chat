import 'dart:ui';

import 'package:nex_live_chat/common/commons.dart';
import 'package:nex_live_chat/service/app_storage.dart';

import 'app.dart';

Locale? get deviceLocale => PlatformDispatcher.instance.locale;

Locale? get getCurrentLocale {
  for (var element in [const Locale('vi'), const Locale('en')]) {
    if (element.languageCode == deviceLocale?.languageCode) {
      return element;
    }
  }
  return const Locale('en');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppStorage.init();

  await UtilsOther.initSystemUISettings();

  return runApp(const App());
}
