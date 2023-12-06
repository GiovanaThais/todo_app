import 'package:flutter/material.dart';
import 'package:todo_app/app/theme/light/light_colors.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

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
              "Today's Task",
              style: theme.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Date',
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
        ElevatedButton.icon(
          onPressed: () {},
          label: Text('Nova Tarefa'),
          icon: Icon(Icons.add),
        ),
      ],
    );
  }
}
