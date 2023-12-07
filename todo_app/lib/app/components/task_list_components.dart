import 'package:flutter/material.dart';

import '../widgets/task_card_widget.dart';

class TaskListComponent extends StatelessWidget {
  const TaskListComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (_, index) {
          return TaskCardWidget(
            isDone: index.isEven,
            description: 'Description $index',
            endDate: DateTime.now(),
            initialDate: DateTime.now(),
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
