import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nex_live_chat/common/utils/constants.dart';

class EventSinglePageUtil {
  EventSinglePageUtil._();

  static final _instance = EventSinglePageUtil._();

  final List<String> _storage = [];

  static void initialise() async {
    try {
      _instance._storage.clear();
      final idsString = GetStorage().read(AppConstants.storageEventSinglePage) ?? <String>[];
      _instance._storage.addAll((idsString as List).map((e) => e.toString()).toList());
    } on PlatformException catch (e) {
      debugPrint('${e.message}');
    }
  }

  static bool checkIsShow(int id) {
    return false;
    // return _instance._storage.contains(id.toString());
  }

  static void setIdClickEventPage(int id) {
    // _instance._storage.add(id.toString());
    // GetStorage().write(AppConstants.storageEventSinglePage, _instance._storage);
  }

  static void clearAll() {
    _instance._storage.clear();
    GetStorage().remove(AppConstants.storageEventSinglePage);
  }
}
