import 'package:flutter/material.dart';
import 'package:todo_app/app/theme/light/light_colors.dart';

import '../pages/add_task_page.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget(
      {super.key,
      required Function() onAddTap,
      required String subtitle,
      required String title});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  void navigateToForm() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const AddTaskPage();
        },
      ),
    );
  }

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
              "Tarefas de hoje",
              style: theme.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Hoje',
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
        ElevatedButton.icon(
          onPressed: navigateToForm,
          label: Text('Nova Tarefa'),
          icon: Icon(Icons.add),
        ),
      ],
    );
  }
}
