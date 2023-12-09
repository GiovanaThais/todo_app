import 'package:flutter/material.dart';
import 'package:todo_app/app/core/theme/light/light_colors.dart';

import '../../modules/value_notifier/pages/add_task_vn_page.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget(
      {super.key,
      required this.onAddTap,
      required this.subtitle,
      required this.title});

  final void Function() onAddTap;
  final String title;
  final String subtitle;

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: theme.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.subtitle,
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
        ElevatedButton.icon(
          onPressed: widget.onAddTap,
          label: Text('Nova Tarefa'),
          icon: Icon(Icons.add),
        ),
      ],
    );
  }
}
