import 'package:flutter/material.dart';
import 'package:todo_app/app/theme/color_extension.dart';
import 'package:todo_app/app/theme/light/light_colors.dart';

class LightTheme {
  static final theme = ThemeData(
      dividerColor: LightColors.gray,
      textTheme: const TextTheme(
        titleSmall: TextStyle(color: LightColors.gray),
        bodyMedium: TextStyle(color: LightColors.gray),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: LightColors.lightPurple,
          foregroundColor: LightColors.purple,
          shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
      extensions: [
        ColorExtension(
            focusedBadgeColor: LightColors.purple,
            unfocusedBadgeColor: LightColors.lightPurple)
      ]);
}
