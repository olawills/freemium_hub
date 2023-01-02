import 'package:flutter/material.dart';

extension WidgetSpacing on num {
  SizedBox get spacingW => SizedBox(width: toDouble());
  SizedBox get spacingH => SizedBox(width: toDouble());
}

extension WidgetTheme on ThemeMode {
  ValueNotifier<ThemeMode> get darkThemeOn => ValueNotifier(ThemeMode.system);
}
