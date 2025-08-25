import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';

mixin AppFormValidator {
  static String? validateEmpty(
    String? input, {
    String? fieldName,
    String? overrideErrorText,
  }) {
    if (input?.trim().isNotEmpty == true) {
      return null;
    }
    return overrideErrorText ?? '${'Please_enter'.tr()} $fieldName';
  }

  static String? validatePhoneNumber(
    String? input, {
    String fieldName = 'Phone number',
  }) {
    if (input == null || input.isEmpty) {
      return validateEmpty(input, fieldName: fieldName);
    }

    if (!isPhoneNumber(input)) {
      return "invalid_phone_number".tr();
    }

    return null;
  }

  static String? validateEmail(
    String? input, {
    String fieldName = 'Email Address',
  }) {
    if (input == null || input.isEmpty) {
      return validateEmpty(input, fieldName: fieldName);
    }
    if (RegExp(r'^[\w-+\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(input)) {
      return null;
    }
    return 'Invalid_email_address'.tr();
  }

  static String? validateYoutube(String url, {bool trimWhitespaces = true}) {
    RegExp pattern = RegExp(
        r'^(?:https?:\/\/)?(?:www\.)?(?:m\.)?(?:youtu\.be\/|youtube\.com\/(?:watch\?(?:.*&)?v(?:i)?=|(?:embed|v|vi|user|shorts)\/))([^\?&\>]+)');
    Match? match = pattern.firstMatch(url);

    if (match != null && match.groupCount >= 1) {
      String videoId = match.group(1)!;
      return videoId;
    } else {
      debugPrint('Không tìm thấy kết quả phù hợp');
    }
    return '';
  }

  static String? validateUserName(
    String? input, {
    String fieldName = 'Username',
  }) {
    if (input == null || input.isEmpty) {
      return validateEmpty(input, fieldName: fieldName);
    }
    if (input.length < 8) {
      return '$fieldName ${'more_than_8_characters'.tr()}';
    }
    bool containsLetter = input.contains(RegExp(r'[a-zA-Z]'));
    if (!containsLetter) {
      return '$fieldName ${'contains_at_least_one_letter'.tr()}';
    }
    return null;
  }

  static String? validateDisplayName(
    String? input, {
    String fieldName = 'Display name',
  }) {
    if (input == null || input.isEmpty) {
      return validateEmpty(input, fieldName: fieldName);
    }
    bool containsLetter = input.contains(RegExp(r'[a-zA-Z]'));
    if (!containsLetter) {
      return '$fieldName ${'contains_at_least_one_letter'.tr()}';
    }
    return null;
  }

  static bool hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }

  static bool isPhoneNumber(String s) {
    if (s.length > 16 || s.length <= 9) return false;
    return hasMatch(s, r'^[0]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  }

  static bool isPhoneNumberVN(String s) {
    if (s.length != 10) return false;
    return hasMatch(s, r'^[0][0-9]*$');
  }

  static String? validateURL(String? link) {
    if (link == null || link.isEmpty) {
      return validateEmpty(link, overrideErrorText: "Please_enter_this_field".tr());
    }
    final RegExp linkRegex = RegExp(
      r"^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$",
      caseSensitive: false,
      multiLine: false,
    );
    final match = linkRegex.hasMatch(link);
    if (!match) {
      return 'Please_enter_the_correct_link_format'.tr();
    }
    return null;
  }

  static String? validateCorrectPassword(String s, String s2) {
    if (s.trim() != s2.trim()) {
      return 'Passwords_are_not_the_same'.tr();
    }

    if (RegExp(r'(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.{8,}).*$').hasMatch(s) && s.length >= 8) {
      return null;
    }
    if (RegExp(r'(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.{8,}).*$').hasMatch(s2) && s2.length >= 8) {
      return null;
    }
    return 'Passwords_must_be_at_least_8_characters_Minimum_1_uppercase_letter_1_lowercase_letter_and_1_number'.tr();
  }
}
