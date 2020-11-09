import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';

/// p1: first parameter in condition
/// p2: Second parameter in condition. default value is [Null]
/// returnValue: An object which returns if the condition was true
shortIf({
  dynamic p1,
  dynamic p2,
  dynamic returnValue,
}) =>
    (p1 == p2 || p2 == null) ? returnValue : p1;

void exitApp() => SystemChannels.platform.invokeMethod('SystemNavigator.pop');

///********** STRINGS **********/
/// Convert the farsi digits to english digits in a string
String faDigitToEnDigit(String digit) => (digit
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
String enDigitToFaDigit(String digit) => (digit
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

extension StringUtils on String {
  /// Adds an extra 0 in behind a String
  /// It is useful when you want to show a time; It converts '5' to '05'
  String get addExtraZero => (this.length == 1) ? ('0' + this) : this;

  /// If you are using [easy_localization] package, to apply translation on strings, simply use [gTR] extension!
  /// example: 'someText'.gTR
  String get gTR => tr(this);

  /// The [isEmpty] method with professional check!
  bool get gIsEmpty {
    if (this == null || this.isEmpty || this == 'null') return true;
    String data = this;
    data = data.replaceAll(' ', '');
    data = data.replaceAll('\n', '');
    if (data == null || data.isEmpty)
      return true;
    else
      return false;
  }

  bool get gIsNotEmpty => !this.gIsEmpty;
}
