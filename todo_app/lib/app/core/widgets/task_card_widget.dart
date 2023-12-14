import 'package:flutter/material.dart';
import 'package:todo_app/app/core/shared/utils/app_formatters.dart';
import 'package:todo_app/app/core/widgets/task_done_widget.dart';

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget(
      {required super.key,
      required this.isDone,
      required this.title,
      required this.description,
      required this.initialDate,
      required this.endDate,
      required this.onTap,
      required this.onDismiss});

  final bool isDone;
  final String title;
  final String description;
  final DateTime initialDate;
  final DateTime endDate;
  final VoidCallback onTap;
  final VoidCallback onDismiss;

  TextDecoration get titleDecoration {
    if (isDone) {
      return TextDecoration.lineThrough;
    } else {
      return TextDecoration.none;
    }
  }

  String get initHour =>
      AppFormatters.formatHour(TimeOfDay.fromDateTime(initialDate));
  String get endHour =>
      AppFormatters.formatHour(TimeOfDay.fromDateTime(endDate));
  String get dayMessage {
    final message = AppFormatters.dayMessage(initialDate);

    return message ?? AppFormatters.onlyDays(initialDate);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dismissible(
      key: key!,
      direction: DismissDirection.startToEnd,
      onDismissed: (_) => onDismiss(),
      child: Card(
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
                  GestureDetector(
                      onTap: onTap, child: TakeDoneWidget(isDone: isDone)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: const Divider(),
              ),
              Text.rich(TextSpan(children: [
                TextSpan(text: '$dayMessage   '),
                TextSpan(text: '$initHour - $endHour')
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
