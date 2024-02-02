import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get size => mediaQuery.size;

  bool get isDartMode => theme.brightness == Brightness.dark;

  double get width => size.width;

  double get height => size.height;
}
