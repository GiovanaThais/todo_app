import 'package:flutter/material.dart';

class ColorExtension extends ThemeExtension<ColorExtension> {
  const ColorExtension({
    required this.doneBackgroundColor,
    required this.focusedBadgeColor,
    required this.unfocusedBadgeColor,
  });

  final Color focusedBadgeColor;
  final Color unfocusedBadgeColor;
  final Color doneBackgroundColor;

  @override
  ThemeExtension<ColorExtension> copyWith({
    Color? focusedBadgeColor,
    Color? unfocusedBadgeColor,
  }) {
    return ColorExtension(
        doneBackgroundColor: doneBackgroundColor ?? this.doneBackgroundColor,
        focusedBadgeColor: focusedBadgeColor ?? this.focusedBadgeColor,
        unfocusedBadgeColor: unfocusedBadgeColor ?? this.unfocusedBadgeColor);
  }

  @override
  ThemeExtension<ColorExtension> lerp(
      covariant ThemeExtension<ColorExtension>? other, double t) {
    if (other == null || t < 0.5) return this;
    return other;
  }
}
