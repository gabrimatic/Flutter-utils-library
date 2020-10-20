import 'package:easy_localization/easy_localization.dart';

extension GabrimaticStringUtils on String {
  /// Adds an extra 0 in behind a String
  /// It is useful when you want to show a time; It converts '5' to '05'
  String get gAddExtraZero => (this.length == 1) ? ('0' + this) : this;

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
