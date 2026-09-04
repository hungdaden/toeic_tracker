import 'package:intl/intl.dart';


class AppUtil {
  AppUtil._();

  static String formatPrice(double price) {
    return NumberFormat.currency(symbol: '￥', decimalDigits: 0).format(price);
  }

  static String formatNumber(int number) {
    return NumberFormat('#,##0').format(number);
  }

  static bool isValidPassword(String password) {
    const minimumPasswordLength = 6;
    const whitespace = ' ';

    return password.length >= minimumPasswordLength && !password.contains(whitespace);
  }

  static bool isValidEmail(String email) {
    final value = email.trim();
    if (value.isEmpty || value.length > 254) {
      return false;
    }

    if (!RegExp(
      r"^(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"
      r'"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")'
      r'@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|'
      r'\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}'
      r'(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:'
      r'(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])$',
    ).hasMatch(value)) {
      return false;
    }

    return true;
  }

  static bool isKatakana(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return false;
    }
    return RegExp(r'^([ァ-ン]|ー)+$').hasMatch(trimmed);
  }

  static bool isValidPhoneNumber(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return false;
    }

    if (trimmed.length > 15) {
      return false;
    }

    return RegExp(r'^[0-9]+$').hasMatch(trimmed);
  }

  static bool isValidEmailOrPhone(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return false;
    }

    if (isValidEmail(trimmed)) {
      return true;
    }

    return isValidPhoneNumber(trimmed);
  }
}
