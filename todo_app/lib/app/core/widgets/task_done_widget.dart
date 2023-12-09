import 'package:flutter/material.dart';
import 'package:todo_app/app/core/theme/color_extension.dart';

import '../theme/color_extension.dart';

class TakeDoneWidget extends StatelessWidget {
  const TakeDoneWidget({super.key, required this.isDone, this.radius = 16});
  final bool isDone;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorExtension = theme.extension<ColorExtension>()!;

    return Container(
      height: radius * 2,
      width: radius * 2,
      decoration: BoxDecoration(
        color: isDone ? colorExtension.doneBackgroundColor : Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
            color: isDone
                ? colorExtension.doneBackgroundColor
                : colorExtension.unfocusedBadgeColor),
      ),
      child: Center(
          child: Icon(
        Icons.check,
        color: Colors.white,
      )),
    );
  }
}
