import 'package:flutter/material.dart';

class ColorExtension extends ThemeExtension<ColorExtension> {
  final Color focusedBadgeColor;
  final Color unfocusedBadgeColor;

  ColorExtension(
      {required this.focusedBadgeColor, required this.unfocusedBadgeColor});

  //ColorExtension({required this.focusedBadgeColor, required this.unfocousedBadgeColor});
  @override
  ThemeExtension<ColorExtension> copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  ThemeExtension<ColorExtension> lerp(
      covariant ThemeExtension<ColorExtension>? other, double t) {
    // TODO: implement lerp
    if (other == null || t < 0.5) return this;
    return other;
  }
}
