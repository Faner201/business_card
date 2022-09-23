import 'package:flutter/material.dart';

class AppTheme {
  static const _defaulfFontFamily = 'Ubuntu';

  static ThemeData theme(bool isDark) {
    final brightness = isDark ? Brightness.dark : Brightness.light;
    final theme = ThemeData(
      brightness: brightness,
      fontFamily: _defaulfFontFamily,
    );
    return theme.copyWith(
      iconTheme: theme.iconTheme.copyWith(size: 35),
    );
  }
}
