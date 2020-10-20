library gabrimatic_utils;

import 'package:flutter/services.dart';

class GabrimaticUtils {
  /// Convert the farsi digits to english digits in a string
  static String faDigitToEnDigit(String digit) => (digit
      .replaceAll('٠', '0')
      .replaceAll('۱', '1')
      .replaceAll('۲', '2')
      .replaceAll('۳', '3')
      .replaceAll('۴', '4')
      .replaceAll('۵', '5')
      .replaceAll('۶', '6')
      .replaceAll('۷', '7')
      .replaceAll('۸', '8')
      .replaceAll('۹', '9'));

  /// Convert the english digits to farsi digits in a string
  static String enDigitToFaDigit(String digit) => (digit
      .replaceAll('0', '٠')
      .replaceAll('1', '۱')
      .replaceAll('2', '۲')
      .replaceAll('3', '۳')
      .replaceAll('4', '۴')
      .replaceAll('5', '۵')
      .replaceAll('6', '۶')
      .replaceAll('7', '۷')
      .replaceAll('8', '۸')
      .replaceAll('9', '۹'));

  /// p1: first parameter in condition
  /// p2: Second parameter in condition. default value is [Null]
  /// returnValue: An object which returns if the condition was true
  static shortIf(dynamic p1, dynamic returnValue, {dynamic p2}) =>
      (p1 == p2 || p2 == null) ? returnValue : p1;

  static void exitApp() =>
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
}
