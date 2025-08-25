import 'package:get_storage/get_storage.dart';

class AppStorage {
  factory AppStorage() => _instance;
  static final AppStorage _instance = AppStorage._internal();

  AppStorage._internal();

  // static AppStorage get instance => _instance;

  late GetStorage _getStorage;

  static Future<void> init() async {
    await GetStorage.init();
    _instance._getStorage = GetStorage();
  }

  static Future<void> write(String key, dynamic value) async {
    return await _instance._getStorage.write(key, value);
  }

  static T? read<T>(String key) {
    return _instance._getStorage.read(key);
  }

  static Future<void> remove(String key) async {
    return await _instance._getStorage.remove(key);
  }
}
