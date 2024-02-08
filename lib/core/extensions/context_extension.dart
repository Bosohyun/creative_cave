import 'package:creative_cave/core/common/app/providers/user_provider.dart';
import 'package:creative_cave/src/auth/domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get size => mediaQuery.size;

  bool get isDartMode => theme.brightness == Brightness.dark;

  double get width => size.width;

  double get height => size.height;

  UserProvider get usesProvider => read<UserProvider>();

  LocalUser? get currentUser => usesProvider.user;
}
