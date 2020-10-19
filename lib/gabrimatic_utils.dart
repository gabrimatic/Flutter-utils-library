library gabrimatic_utils;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'creator.dart';

class GabrimaticUtils {
  String enNumberToFaNumber(String digits) => (digits
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

  shortIf(
    dynamic p1,
    dynamic p2,
    dynamic returnValue,
  ) =>
      (p1 == p2 || p2 == null) ? returnValue : p1;

  void restartApp(BuildContext context) => Creator.recreate(context);

  void exitApp() => SystemChannels.platform.invokeMethod('SystemNavigator.pop');
}
