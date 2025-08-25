import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DateTimeUtil {
  static DateTime? utcStringToLocal(String? input) {
    if (input == null || input.isEmpty) return null;
    return DateTime.tryParse(input)?.toLocal();
  }

  static String? localDateTimeToUTCString(DateTime? input) {
    return input?.toUtc().toIso8601String();
  }

  static DateTime localDateToUTC(DateTime input) {
    return input.toUtc();
  }

  static String formatDateTime(String? input, {String format = 'dd/MM/yyyy HH:mm:ss'}) {
    try {
      if (input == null || input.isEmpty) return '';
      return DateFormat(format).parse(input).formatDateTime(format);
    } catch (e) {
      return '';
    }
  }

  static List<DateTime> getThisWeek({DateTime? date}) {
    final today = date ?? DateTime.now();
    final firstDayOfTheWeek = today.subtract(Duration(days: today.weekday - 1));
    final fromDate = firstDayOfTheWeek;
    final toDate = firstDayOfTheWeek.add(const Duration(days: 6));
    return [fromDate, toDate];
  }

  static List<DateTime> datesBetween2(DateTime start, DateTime end) {
    if (end.isBefore(start)) return [];
    final s = DateTime(start.year, start.month, start.day);
    final e = DateTime(end.year, end.month, end.day);
    final count = e.difference(s).inDays + 1;
    return List.generate(count, (i) => DateTime(s.year, s.month, s.day + i));
  }

  static List<DateTime> getThisMonth({DateTime? date}) {
    final today = date ?? DateTime.now();
    final fromDate = DateTime(today.year, today.month, 1);
    final toDate = DateTime(today.year, today.month + 1, 1).subtract(const Duration(days: 1));
    return [fromDate, toDate];
  }

  static bool checkDate({required DateTime currentDate, required DateTime targetDate}) {
    return currentDate.year == targetDate.year && currentDate.month == targetDate.month && currentDate.day == targetDate.day;
  }

  static bool isBeforeToday(DateTime date, DateTime? nowDateTime) {
    final now = nowDateTime ?? DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final compareDate = DateTime(date.year, date.month, date.day);
    return compareDate.isBefore(today);
  }
}

extension DateTimeExt on DateTime {
  static const timeFormatHHMMA = 'HH:mm a';
  static const dateFormatMMMddYYY = 'MMM dd, yyyy';
  static const dateFormatMMMMddYYY = 'MMMM dd, yyyy';
  static const dateFormatMMMMYYY = 'MMMM, yyyy';
  static const dateFormatddMMMMYYY = 'dd MMMM, yyyy';
  static const dateFormatddMMMMHHmma = 'dd MMMM, HH:mma';
  static const dateFormatddMMMyyyyHHmma = 'dd MMM yyyy, HH:mma';
  static const dateFormatddMM = 'dd/MM';
  static const dateFormatddMMyyyy = 'dd/MM/yyyy';
  static const dateFormatddMMMyyyy = 'dd MMM, yyyy';
  static const dateFormatHHMMddMMMyyyy = 'HH:mm - dd MMMM yyyy';
  static const dateFormatHHMMddMMyyyy = 'HH:mm dd/MM/yyyy';
  static const dateFormatHHMMddMMyyyy2 = 'HH:mm - dd/MM/yyyy';
  static const dateFormatyyyyMMdd = 'yyyy-MM-dd';
  static const dateFormatE = 'E';
  static const dateFormatEEEdd = 'EEE, dd';
  static const dateFormatEMMMMDDYYYY = 'EEE, MMMM dd, yyyy';
  static const dateFormatMMMM = 'MMMM';
  static const dateFormatddMMyyyyHHmma = 'dd/MM/yyyy, HH:mm a';
  static const dateFormatddMMMMYYYWithDots = 'dd.MM.yyyy';
  static const dateFormatddMMMHHHSS = 'dd MMM HH:ss';
  static const dateFormatddMMMMHHHSS = 'dd MMMM HH:ss';

  static const dateFormatDD = 'dd';
  static const dateFormatMDD = 'M:dd';

  String get formatTimeHHMM => DateFormat('HH:mm').format(this);

  String get formatTimeHHMMA => DateFormat(timeFormatHHMMA).format(this);

  String get formatTimeHHMMddMMMyyyy => DateFormat(dateFormatHHMMddMMMyyyy).format(this);

  String get formatDateMMMddYYY => DateFormat(dateFormatMMMddYYY).format(this);

  String get formatDateMMMMddYYY => DateFormat(dateFormatMMMMddYYY).format(this);

  String get formatDateFormatddMMMMYYY => DateFormat(dateFormatddMMMMYYY).format(this);

  String get formatDateddMMyyyy => DateFormat(dateFormatddMMyyyy).format(this);

  String get formatDateyyyyMMdd => DateFormat(dateFormatyyyyMMdd).format(this);

  String get formatDateHHMMddMMyyyy => DateFormat(dateFormatHHMMddMMyyyy).format(this);
  String get formatDateHHMMddMMyyyy2 => DateFormat(dateFormatHHMMddMMyyyy2).format(this);

  String get formatDateddMM => DateFormat(dateFormatddMM).format(this);

  String get formatDateddMMMMHHmma => DateFormat(dateFormatddMMMMHHmma).format(this);

  String get formatDateddMMMMyyyy => DateFormat(dateFormatMMMMYYY).format(this);
  String get formatdateFormatddMMMMYYYWithDots => DateFormat(dateFormatddMMMMYYYWithDots).format(this);
  String get formatDateddMMMyyyy => DateFormat(dateFormatddMMMyyyy).format(this);

  String get formatDateE => DateFormat(dateFormatE).format(this);

  String get formatDateEMMMMDDYYYY => DateFormat(dateFormatEMMMMDDYYYY).format(this);

  String get formatDateEEEdd => DateFormat(dateFormatEEEdd).format(this);

  String get formatDateMMMM => DateFormat(dateFormatMMMM).format(this);

  String get formatDateddMMMHHHSS => DateFormat(dateFormatddMMMHHHSS).format(this);

  String get formatDateddMMMMHHHSS => DateFormat(dateFormatddMMMMHHHSS).format(this);

  String get formatDateDD => DateFormat(dateFormatDD).format(this);

  String get formatDateddMMMyyyyHHmmaa => DateFormat(dateFormatddMMMyyyyHHmma).format(this);

  String get formatDateddMMyyyyHHmma => DateFormat(dateFormatddMMyyyyHHmma).format(this);

  String formatDateTime(String formatter, {String? locale}) => DateFormat(formatter, locale).format(this);

  String get formatDateMdd => DateFormat(dateFormatMDD).format(this);

  DateTime get date => DateTime(year, month, day);

  DateTime copyWith({int? yearN, int? monthN, int? dayN}) => DateTime(yearN ?? year, monthN ?? month, dayN ?? day);

  DateTime copyWithFull({int? yearN, monthN, dayN, hourN, minuteN, secondN}) =>
      DateTime(yearN ?? year, monthN ?? month, dayN ?? day, hourN ?? hour, minuteN ?? minute, secondN ?? second);

  bool differenceDateTime(DateTime date) {
    return day == date.day && month == date.month && year == date.year;
  }

  int containsDate({required List<DateTime> listDate}) {
    return listDate.indexWhere((element) => differenceDateTime(element));
  }

  String timeAgoSinceDate() {
    final date2 = DateTime.now();
    final difference = date2.difference(this);
    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()} yearsAgo';
    } else if (difference.inDays >= 30) {
      return '${(difference.inDays / 30).floor()} monthsAgo';
    } else if (difference.inDays >= 7) {
      return '${(difference.inDays / 7).floor()} w';
    } else if (difference.inDays >= 1) {
      return '${difference.inDays} d';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours} h';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes} m';
    } else {
      return 'Now'.tr();
    }
  }

  String timeMessageChat() {
    final date2 = DateTime.now();
    final difference = date2.difference(this);
    if (difference.inDays > 365) {
      return formatDateHHMMddMMyyyy2;
    } else if (difference.inDays >= 30) {
      return formatDateHHMMddMMyyyy2;
    } else if (difference.inDays >= 7) {
      return formatDateHHMMddMMyyyy2;
    } else if (difference.inDays >= 1) {
      return formatDateHHMMddMMyyyy2;
    } else if (difference.inHours >= 1) {
      return formatDateHHMMddMMyyyy2;
    } else if (difference.inMinutes >= 1) {
      return formatTimeHHMM;
    } else {
      return formatTimeHHMM;
    }
  }

  String timeMinuteAgo() {
    final date2 = DateTime.now();
    final difference = date2.difference(this);
    if (difference.inHours >= 1) {
      return '59m';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes}m';
    } else {
      return '';
    }
  }

  DateTime applied(TimeOfDay time) {
    return DateTime(year, month, day, time.hour, time.minute);
  }

  TimeOfDay get toTimeOfDay {
    return TimeOfDay.fromDateTime(this);
  }

  List<DateTime> get getThisWeek {
    final firstDayOfTheWeek = subtract(Duration(days: weekday - 1));
    final fromDate = firstDayOfTheWeek;
    final toDate = firstDayOfTheWeek.add(const Duration(days: 6));
    return [fromDate, toDate];
  }

  List<DateTime> get getThisMonth {
    final firstDayOfTheMonth = copyWith(dayN: 1);
    final fromDate = firstDayOfTheMonth;
    final toDate = copyWith(dayN: 1, monthN: month + 1).subtract(const Duration(days: 1));
    return [fromDate, toDate];
  }

  List<DateTime> get getNextMonth {
    final firstDayOfTheMonth = copyWith(dayN: 1, monthN: month + 1);
    final fromDate = firstDayOfTheMonth;
    final toDate = copyWith(dayN: 1, monthN: month + 2).subtract(const Duration(days: 1));
    return [fromDate, toDate];
  }

  List<DateTime> get getNextWeek {
    final firstDayOfTheWeek = subtract(Duration(days: weekday - 1));
    final fromDate = firstDayOfTheWeek.add(const Duration(days: 7));
    final toDate = fromDate.add(const Duration(days: 6));
    return [fromDate, toDate];
  }

  DateTime appliedDuration(Duration time) {
    return DateTime(year, month, day, time.inMinutes ~/ 60, time.inMinutes % 60);
  }
}

extension DurationExt on Duration {
  String get formatHHMM {
    final hours = inHours.toString().padLeft(2, '0');
    final minutes = inMinutes.remainder(60).toString().padLeft(2, '0');
    return '$hours:$minutes';
  }
}

class CountimeCallResult {
  String formattedTime;
  int remainingSeconds;

  CountimeCallResult({required this.formattedTime, required this.remainingSeconds});
}

CountimeCallResult formatDurationCall(Duration duration) {
  String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  String formattedTime = "$twoDigitMinutes:$twoDigitSeconds";
  int remainingSeconds = duration.inSeconds.remainder(60);

  return CountimeCallResult(formattedTime: formattedTime, remainingSeconds: remainingSeconds);
}
