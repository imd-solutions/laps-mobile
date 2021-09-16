import 'package:flutter/widgets.dart';

// Font for the application.
class Font {
  static const String primaryFont = 'Nexa';
  static const String secondaryFont = 'Raleway';

  Font._();

  static const _kFontFam = 'MyFlutterApp';
  static const _kFontFam2 = 'MyFlutterApp2';
  static const String? _kFontPkg = null;

  static const IconData home = IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData file_empty = IconData(0xe81d, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData users = IconData(0xe82b, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData magnifier = IconData(0xe86f, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData chat = IconData(0xe800, fontFamily: _kFontFam2, fontPackage: _kFontPkg);
}
