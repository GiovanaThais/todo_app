import 'package:flutter/material.dart';
import 'package:todo_app/app/core/models/task_model.dart';

class TaskVnStore extends ValueNotifier<List<TaskModel>> {
  TaskVnStore() : super([]);

  Future<void> getTasks(DateTime date) async {
    final tasks = List.generate(5, (index) {
      return TaskModel(
        id: index,
        title: 'Title $index',
        description: 'Description $index',
        initialDate: date,
        endDate: date.add(Duration(minutes: index * 5)),
        isDone: index.isEven,
        status: taskStatus.values[index % 3],
      );
    });
    value = tasks;
  }
}
