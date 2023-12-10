import 'package:flutter/material.dart';
import 'package:todo_app/app/modules/value_notifier/stores/tasks_vn_store.dart';

import '../core/widgets/task_card_widget.dart';

class TaskListComponent extends StatelessWidget {
  const TaskListComponent({super.key, required this.taskVnStore});

  final TaskVnStore taskVnStore;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: taskVnStore,
        builder: (_, tasks, __) {
          return ListView.separated(
            itemCount: tasks.length,
            separatorBuilder: (_, __) => const SizedBox(
              height: 8,
            ),
            itemBuilder: (_, index) {
              final task = tasks.elementAt(index);
              return TaskCardWidget(
                isDone: task.isDone,
                description: task.description,
                initialDate: task.initialDate,
                endDate: task.endDate,
                onTap: () {},
                title: task.title,
              );
            },
          );
        });
  }
}
