// ignore_for_file: depend_on_referenced_packages, unrelated_type_equality_checks, deprecated_member_use
import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:html/parser.dart';
import 'package:nex_live_chat/routers/nex_navigate.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../commons.dart';

class UtilsOther {
  static Timer? _timer;
  static AppService appService = getIt.get<AppService>();

  static Future<void> initSystemUISettings() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        //==== status bar===
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark, // Android
        statusBarBrightness: Brightness.light, // iOS
        //===== navigation bar ===
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarContrastEnforced: true,
      ),
    );
  }

  static debounceTime(void Function() callback, {int millisecond = 500}) async {
    //
    if (_timer?.isActive == true) _timer?.cancel();
    _timer = Timer(Duration(milliseconds: millisecond), () {
      callback.call();
      _timer?.cancel();
      _timer = null;
    });
  }

  static String convertHtmlToString(dynamic html) {
    if (html == null) {
      return '';
    }
    return parse(html).documentElement?.text ?? '';
  }

  static bool compareWithoutSeconds(DateTime dt1, DateTime dt2) {
    return dt1.year == dt2.year && dt1.month == dt2.month && dt1.day == dt2.day && dt1.hour == dt2.hour && dt1.minute == dt2.minute;
  }

  static Future<String> getUniqueDeviceId() async {
    String uniqueDeviceId = '-1';
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      uniqueDeviceId = '${iosDeviceInfo.identifierForVendor}'; //
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      uniqueDeviceId = androidDeviceInfo.id; // unique ID
    }
    return uniqueDeviceId;
  }

  static num calculateDiscountedPrice(num originalPrice, num discountPercent) {
    if (discountPercent < 0 || discountPercent > 100) {
      throw ArgumentError('Discount percent must be between 0 and 100');
    }

    final discountAmount = originalPrice * (discountPercent / 100);
    return originalPrice - discountAmount;
  }

  static num calculateDiscountPercent(num originalPrice, num discountedPrice) {
    if (originalPrice <= 0) {
      throw ArgumentError('Original price must be greater than 0');
    }

    if (discountedPrice > originalPrice) {
      return 0;
    }

    final discountAmount = originalPrice - discountedPrice;
    return (discountAmount / originalPrice) * 100;
  }

  static String convertDay(String day) {
    String dayOfWeek = '';
    switch (day) {
      case 'mon':
        dayOfWeek = 'Mon'.tr();
        break;
      case 'tue':
        dayOfWeek = 'Tues'.tr();
        break;
      case 'wed':
        dayOfWeek = 'Wed'.tr();
        break;
      case 'thu':
        dayOfWeek = 'Thu'.tr();
        break;
      case 'fri':
        dayOfWeek = 'Fri'.tr();
        break;
      case 'sat':
        dayOfWeek = 'Sat'.tr();
        break;
      case 'sun':
        dayOfWeek = 'Sun'.tr();
        break;
    }
    return dayOfWeek;
  }

  static num? parseNum(dynamic value) {
    if (value == null) return null;
    final quantity = num.tryParse(value!.toString());
    if (quantity != null) {
      if (quantity % 1 == 0) {
        return quantity.toInt();
      }
    }
    return quantity;
  }

  static List<Map<String, Object>> countryCodes = [
    {'code': '+84', 'flag': 'ic_flag_vn.svg', 'area': 84},
    {'code': '+1', 'flag': 'ic_flag_en.svg', 'area': 1},
  ];

  String getAreaByPhoneNumber(String phoneNumber) {
    return countryCodes.where((e) => phoneNumber.contains(e['code'].toString()) == true).first['area'].toString();
  }

  static Future<Position> currentPositionLocation() async {
    var currentPosition = Position(
      latitude: 0,
      longitude: 0,
      timestamp: DateTime.now(),
      accuracy: 0,
      altitude: 0,
      heading: 0,
      speedAccuracy: 0,
      speed: 0,
      altitudeAccuracy: 0,
      headingAccuracy: 0,
    );
    final permission = await Geolocator.checkPermission();
    if (permission != LocationPermission.denied && permission != LocationPermission.deniedForever) {
      currentPosition = await Geolocator.getCurrentPosition();
    }
    return currentPosition;
  }

  static Future<bool> requiredPermissionLocation() async {
    final permission = await Geolocator.checkPermission();
    if (permission != LocationPermission.denied && permission != LocationPermission.deniedForever) {
      return true;
    }
    NexDialog.showNexDialogAction(
      'notification'.tr(),
      'Bạn cần cấp quyền vị trí để có thể tiếp tục tính năng này!'.tr(),
      'Cancel'.tr(),
      'OK',
      NexNavigate.pop,
      () {
        Geolocator.openLocationSettings();
      },
    );
    return false;
  }

  static Future<bool> requiredPermissionStorage() async {
    final permission = await Permission.storage.request();
    if (permission == PermissionStatus.granted) {
      return true;
    }
    NexDialog.showNexDialogAction('notification'.tr(), 'storage_permission_required'.tr(), 'Cancel'.tr(), 'OK', NexNavigate.pop, () {
      openAppSettings();
    });
    return false;
  }

  static Future<String?> getCountryFromLatLng(Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        return place.country;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  static makePhoneCall(String phone) {
    launchUrl(Uri(scheme: 'tel', path: phone));
  }

  static makeSMS(String phone) {
    launchUrl(Uri(scheme: 'sms', path: phone));
  }

  static openMail(String mail) {
    launchUrl(Uri(scheme: 'mailto', path: mail));
  }

  static void openMapByAddress(String address) async {
    String encodedAddress = Uri.encodeComponent(address);
    String googleMapUrl = "https://www.google.com/maps/search/?api=1&query=$encodedAddress";
    if (await canLaunch(googleMapUrl)) {
      await launch(googleMapUrl);
      return;
    }
    throw 'Could not launch ';
  }

  static void openMapByLatLon(dynamic latitude, dynamic longitude) async {
    final googleMapUrl = Uri.parse('https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');

    if (await canLaunchUrl(googleMapUrl)) {
      await launchUrl(googleMapUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not open the map.';
    }
  }

  static Future<String> downloadAndSaveFile(String url, String fileName) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$fileName';
    final Response<List<int>> response = await appService.dio.get<List<int>>(url, options: Options(responseType: ResponseType.bytes));

    final File file = File(filePath);
    await file.writeAsBytes(response.data!);
    return filePath;
  }

  String formatCurrencyK(int amount) {
    if (amount >= 1000) {
      return '${(amount / 1000).toStringAsFixed(0)}k';
    }
    return 'đ${amount.toString()}';
  }

  String formatDurationVoucher(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitDay = twoDigits(duration.inDays);
    String twoDigitHours = twoDigits(duration.inHours.remainder(24));
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));

    String day = twoDigitDay == '00' ? '' : '$twoDigitDay ${'Day'.tr()}';
    String formattedTime = "$day $twoDigitHours ${'Hour'.tr()} $twoDigitMinutes ${'minute'.tr()}";
    return formattedTime;
  }

  bool isOpenStore({DateTime? openDate, DateTime? closeDate}) {
    if (openDate == null || closeDate == null) return false;

    DateTime now = DateTime.now();

    //Đưa về phút để so sánh
    int nowMinutes = now.hour * 60 + now.minute;

    int openMinutes = openDate.hour * 60 + openDate.minute;
    int closeMinutes = closeDate.hour * 60 + closeDate.minute;

    //Mở và đóng cửa trong cùng ngày
    //Ex: Mở cửa lúc 10:00 và đóng cửa lúc 14:30
    if (openMinutes < closeMinutes) return nowMinutes >= openMinutes && nowMinutes <= closeMinutes;

    //Mở cửa trong ngày và đóng ở ngày kế
    //Ex: Mở lúc 23:30 và đóng lúc 03:15
    return nowMinutes >= openMinutes || nowMinutes <= closeMinutes;
  }

  static num parseQuantity(dynamic value) {
    if (value == null) return 0;
    final quantity = num.tryParse(value!.toString());
    if (quantity != null) {
      if (quantity % 1 == 0) {
        return quantity.toInt();
      }
      if (quantity % 0.1 == 0) {
        return double.parse(quantity.toStringAsFixed(1));
      }
      return double.parse(quantity.toStringAsFixed(2));
    }
    return 0;
  }

  static void hideKeyboard(BuildContext context) {
    if (FocusManager.instance.primaryFocus?.hasFocus ?? false) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
