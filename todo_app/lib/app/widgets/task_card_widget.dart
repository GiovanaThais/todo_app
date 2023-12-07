import 'package:flutter/material.dart';
import 'package:todo_app/app/widgets/task_done_widget.dart';

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget(
      {super.key,
      required this.isDone,
      required this.title,
      required this.description,
      required this.initialDate,
      required this.endDate,
      required this.onTap});

  final bool isDone;
  final String title;
  final String description;
  final DateTime initialDate;
  final DateTime endDate;
  final VoidCallback onTap;

  TextDecoration get titleDecoration {
    if (isDone) {
      return TextDecoration.lineThrough;
    } else {
      return TextDecoration.none;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: theme.textTheme.titleLarge?.copyWith(
                          decoration: titleDecoration,
                        )),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      description,
                      style: theme.textTheme.bodyMedium,
                    )
                  ],
                ),
                TakeDoneWidget(isDone: isDone),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: const Divider(),
            ),
            const Text.rich(TextSpan(children: [
              TextSpan(text: 'Today   '),
              TextSpan(text: '10:00 PM - 11:45 PM')
            ]))
          ],
        ),
      ),
    );
  }
}
