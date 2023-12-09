import 'package:flutter/material.dart';

import '../core/widgets/task_card_widget.dart';

class TaskListComponent extends StatelessWidget {
  const TaskListComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (_, index) {
          return TaskCardWidget(
            isDone: index.isEven,
            description: 'Description $index',
            endDate: DateTime.now().add(Duration(minutes: index * 3)),
            initialDate: DateTime.now().add(Duration(days: index)),
            onTap: () {},
            title: 'Title $index',
          );
        },
        separatorBuilder: (_, __) => const SizedBox(
              height: 8,
            ),
        itemCount: 30);
  }
}
