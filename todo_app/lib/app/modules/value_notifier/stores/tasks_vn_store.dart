import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/app/core/models/task_model.dart';
import 'package:todo_app/app/modules/value_notifier/stores/states/tasks_state.dart';

class TaskVnStore extends ValueNotifier<TasksState> {
  TaskVnStore() : super(TasksState.initialState());

  Future<void> getTasks(DateTime date) async {
    value = LoadingTasksVnState();

    await Future.delayed(const Duration(seconds: 3));

    //value = ErrorTasksVnState('Error'); //simulação de mensagem de erro

    //await Future.delayed(const Duration(seconds: 3));
    try {
      final random = Random();

      final tasks = List.generate(50, (index) {
        final now = DateTime.now();
        final initialDate = now.add(Duration(days: random.nextInt(25) - 1));
        return TaskModel(
          id: index,
          title: 'Title $index',
          description: 'Description $index',
          initialDate: initialDate,
          endDate: initialDate.add(Duration(minutes: index * 2)),
          isDone: index.isEven,
          status: TaskStatus.values[index % 3],
        );
      });
      value = value.copyWith(allTasks: tasks, tasksStatus: value.tasksStatus);
      filterTasksByDate(date);
    } catch (e) {
      value = ErrorTasksVnState(e.toString());
    }
  }

  void filterTasksByDate(DateTime date) {
    final tasks = value.allTasks;
    final dateToFilter = _resetHour(date);

    final newCurrentTasks = tasks.where((element) {
      final initial = _resetHour(element.initialDate);
      return initial.isAtSameMomentAs(dateToFilter);
    }).toList();

    value = value.copyWith(
        tasksStatus: value.tasksStatus,
        currentDateTasks: newCurrentTasks,
        filteredTasks: newCurrentTasks);
  }

  void clearStatusFilter() {
    value = value.copyWith(filteredTasks: value.currentDateTasks);
  }

  void filterTasksByStatus(TaskStatus status) {
    final tasks = value.currentDateTasks;

    final filteredTasks = tasks.where((element) {
      return element.status == status;
    }).toList();

    value = value.copyWith(tasksStatus: status, filteredTasks: filteredTasks);
  }

  DateTime _resetHour(DateTime date) {
    return date.copyWith(
        hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);
  }
}
