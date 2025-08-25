import 'package:intl/intl.dart';

extension DynamicExtension on dynamic {
  String get formatCurrencyNoName {
    const locale = 'en';
    const currencyName = '';
    const errorText = '0';
    var formatter = NumberFormat.currency(locale: locale, name: currencyName, decimalDigits: 0, customPattern: "#,###.##\u00A4");
    switch (runtimeType) {
      case const (num):
      case const (int):
      case const (double):
        return formatter.format(this);
      case const (String):
        var value = double.tryParse(this);
        if (value == null) {
          return errorText;
        }
        return formatter.format(value);
      default:
        return errorText;
    }
  }

  String get formatCurrency {
    const locale = 'vi';
    const errorText = '0';

    switch (runtimeType) {
      case const (num):
      case const (int):
      case const (double):
        var formatter = NumberFormat.simpleCurrency(
          locale: locale,
          decimalDigits: 0,
        );
        // if (this % 1 != 0) {
        //   formatter = NumberFormat.simpleCurrency(
        //     locale: locale,
        //     decimalDigits: 2,
        //   );
        // }
        return formatter.format(this);
      case const (String):
        var value = double.tryParse(this);
        if (value == null) {
          return errorText;
        }
        var formatter = NumberFormat.simpleCurrency(
          locale: locale,
          decimalDigits: 0,
        );
        // if (value % 1 != 0) {
        //   formatter = NumberFormat.simpleCurrency(
        //     locale: locale,
        //     decimalDigits: 2,
        //   );
        // }
        return formatter.format(value);
      default:
        return errorText;
    }
  }

  String get formatNumberDecimal {
    const locale = 'en';
    const errorText = '0';

    switch (runtimeType) {
      case const (num):
      case const (int):
      case const (double):
        var formatter = NumberFormat.simpleCurrency(
          locale: locale,
          decimalDigits: 0,
        );
        if (this % 1 != 0) {
          formatter = NumberFormat.simpleCurrency(
            locale: locale,
            decimalDigits: 2,
          );
        }
        return formatter.format(this).replaceAll('\$', '');
      case const (String):
        var value = double.tryParse(this);
        if (value == null) {
          return errorText;
        }
        var formatter = NumberFormat.simpleCurrency(
          locale: locale,
          decimalDigits: 0,
        );
        if (value % 1 != 0) {
          formatter = NumberFormat.simpleCurrency(
            locale: locale,
            decimalDigits: 2,
          );
        }
        return formatter.format(value).replaceAll('\$', '');
      default:
        return errorText;
    }
  }

  String get formatRating {
    const locale = 'en';
    const errorText = '0';

    switch (runtimeType) {
      case const (num):
      case const (int):
      case const (double):
        var formatter = NumberFormat.simpleCurrency(
          locale: locale,
          decimalDigits: 0,
        );
        if (this % 1 != 0) {
          formatter = NumberFormat.simpleCurrency(
            locale: locale,
            decimalDigits: 1,
          );
        }
        return formatter.format(this).replaceAll('\$', '');
      case const (String):
        var value = double.tryParse(this);
        if (value == null) {
          return errorText;
        }
        var formatter = NumberFormat.simpleCurrency(
          locale: locale,
          decimalDigits: 0,
        );
        if (value % 1 != 0) {
          formatter = NumberFormat.simpleCurrency(
            locale: locale,
            decimalDigits: 1,
          );
        }
        return formatter.format(value).replaceAll('\$', '');
      default:
        return errorText;
    }
  }

  String formatNumberDecimalDigits({int? decimalDigits}) {
    const locale = 'en';
    const currencyName = '';
    const errorText = '0';
    var formatter = NumberFormat.currency(locale: locale, name: currencyName, decimalDigits: decimalDigits ?? 2, customPattern: "#,###.##\u00A4");
    switch (runtimeType) {
      case const (num):
      case const (int):
      case const (double):
        return formatter.format(this);
      case const (String):
        var value = double.tryParse(this);
        if (value == null) {
          return errorText;
        }
        return formatter.format(value);
      default:
        return errorText;
    }
  }

  String get formatSecondToMin {
    if (this is! int) return '00:00';
    return '${(Duration(seconds: this))}'.split('.')[0].padLeft(8, '0').substring(3);
  }

  String get formatCompactNumber {
    if (this is int) {
      final NumberFormat format = NumberFormat.compact();
      return format.format(this);
    }
    throw Exception('Only support int');
  }

  String get replacementDotPrice {
    return toString().replaceAll('.', '').replaceAll(',', '');
  }

  String formatStringTextField(String value) {
    if (value.endsWith('.')) return value;

    final number = double.tryParse(value.replaceAll(",", ""));
    if (number == null) return value;

    final formatter = NumberFormat("#,##0.##", 'en_US');
    return formatter.format(number);
  }
}
