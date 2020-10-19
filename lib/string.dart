import 'package:easy_localization/easy_localization.dart';

extension GabrimaticStringUtils on String {
  String get gAddExtraZero {
    String text = this;
    if (text.length == 1) text = '0' + text;
    return text;
  }

  String get gTR => tr(this);

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
