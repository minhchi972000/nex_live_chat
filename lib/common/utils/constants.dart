import 'package:easy_localization/easy_localization.dart';
import 'package:nex_live_chat/service/app_storage.dart';

class AppConstants {
  static const keyToken = 'token';
  static const keyOnBoarding = 'keyOnBoarding';
  static const keyEmail = 'email';
  static const keyPassword = 'password';
  static const keyBusinessStaffId = 'businessStaffId';
  static const keyRememberMe = 'rememberMe';
  static const keyLanguage = 'language';
  static const keyTimeOpenLogin = "timeOpenLogin";
  static const keyTimeOpenForgotPass = "timeOpenForgotPass";
  static const keyTimeOpenRegister = "timeOpenRegister";
  static const keyTimeOpenVerifyOTP = "timeOpenVerifyOTP";
  static const keyCurrentAvatarUrl = "currentAvatarUrl";
  static const keyCityId = "cityId";
  static const keyIPPrinterConnect = "keyIPPrinterConnect";
  static const keyPortPrinterConnect = "keyPortPrinterConnect";
  static const emailApple = "emailApple";
  static const userNameApple = "userNameApple";
  static const keyFirstOpenApp = 'firstOpenApp';
  static const keyTimeLoginFail = 'timeLoginFail';
  static const keyTimeLockPaymentFail = 'timeLockPaymentFail';
  static const keyTimeLoginPhoneNumber = 'timeLoginPhoneNumber';
  static const keyTimeCallPaymentBookingQR = 'timeCallPaymentBookingQR';
  static const String timeOpenVerifyOtp = "timeOpenVerifyOtp";
  static const String storageEventSinglePage = "storageEventSinglePage";
  static const String idsShopWatched = "idsShopWatched";
  static const String bannerHome = "bannerHome";
  static const String addressDelivery = "addressDelivery";
  static const String userInfoDelivery = "userInfoDelivery";

  ///remote config
  static const remoteConfigUpdateRequired = 'nex_update_required';
  static const remoteConfigAppVersionAndroid = 'nex_app_version_android';
  static const remoteConfigAppVersionIOS = 'nex_app_version_ios';
  static const remoteConfigIsMaintenanceIOS = 'nex_is_maintenance_ios';
  static const remoteConfigIsMaintenanceAndroid = 'nex_is_maintenance_android';
  static const remoteConfigIsShowSpaShopping = 'nex_is_show_spa_shopping';
  static const remoteChangeDomainProd = 'nex_change_domain_prod';
  static const remoteEnableLoginPhoneNumber = 'nex_enable_login_phone_number';

  static const merchantCode = 'LOT';
  static const secretKey = 'LOT_SECRET_KEY';
  static const storeCode = 'LOT1';
  static const returnUrl = 'https://api.nifehub.com/finishOrder';
  static const terminalCode = 'LOT1';
  static const apiEcopay = 'https://mgw-test.finviet.com.vn:6868/api/v1/payment/init';

  // static const String DSN_SENTRY_PROD_URL = 'https://7da9e9c9aabfe3c7e129ec224851d766@o1306935.ingest.us.sentry.io/4507428960534528';
  // static const String DSN_SENTRY_STG_URL = 'https://6be34df774cbf5c63396c0ad80b680a0@o1306935.ingest.us.sentry.io/4507292995616768';

  static String linkAppStore = 'https://apps.apple.com/vn/app/nex-now-n%C3%A2ng-t%E1%BA%A7m-tr%E1%BA%A3i-nghi%E1%BB%87m/id6504881411';
  static String linkGooglePlay = 'https://play.google.com/store/apps/details?id=com.lotviet.nexnow';

  static String get linkPolicy =>
      AppStorage.read(AppConstants.keyLanguage) == 'vi' ? 'https://nexnow.vn/vi/privacy' : 'https://nexnow.vn/en/privacy';

  static String get linkTermOfService =>
      AppStorage.read(AppConstants.keyLanguage) == 'vi' ? 'https://nexnow.vn/vi/terms-of-use' : 'https://nexnow.vn/en/terms-of-use';
}

class TopicNotificationConstants {
  static const topicAllUser = 'all';
  static const topicAllCity = 'all_city';
  static const topicAllLanguage = 'all_language_';
  static const topicAllUserNex = 'all_user_nex';
  static const topicByUser = 'user_';
  static const topicByUserNex = 'nex_user_';
  static const topicAllByLanguage = 'all_buyer_';
}

const Map<String, String> mediaTypes = {
  "dart": "application/dart",
  "js": "application/javascript",
  "html": "text/html; charset=UTF-8",
  "htm": "text/html; charset=UTF-8",
  "css": "text/css",
  "txt": "text/plain",
  "json": "application/json",
  "ico": "image/vnd.microsoft.icon",
  "png": "image/png",
  "bmp": "image/bmp",
  "jpg": "image/jpg",
  "jpeg": "image/jpeg",
  "tiff": "image/tiff",
  "ogg": "audio/ogg",
  "mp3": "audio/mpeg",
  "ogv": "video/ogg",
  "mp4": "video/mp4",
  "mov": "video/mov",
  "webm": "video/webm",
  "pdf": "application/pdf",
  "dcm": "application/dicom",
  "xlsx": "application/octet-stream",
};

enum VerifyTypeEnum { nationalIdentity, driverLicense, passport }

extension VerifyTypeExt on VerifyTypeEnum {
  String get key => ['national_identity', 'driver_license', 'passport'][index];

  String get title => ['National Identity', 'Driver License', 'Passport'][index];
}

enum DateFilterEnum { today, thisWeek, thisMonth }

extension DateFilterEnumExt on DateFilterEnum {
  String get key => ['today', 'this_week', 'this_month'][index];

  String get title => ['Today'.tr(), 'This_week'.tr(), 'This_month'.tr()][index];
}

enum LanguageEnum { vi, en }

extension LanguageEnumExt on LanguageEnum {
  String get title => ['Việt Nam', 'English'][index];
  String get flag => ['ic_vietnam', 'ic_english'][index];
}

enum PaymentMethodEnum { visa, alePay }
