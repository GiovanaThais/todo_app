import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/app/core/models/task_model.dart';
import 'package:todo_app/app/core/repositories/task_repository.dart';
import 'package:todo_app/app/modules/value_notifier/stores/states/tasks_vn_state.dart';

class TaskVnStore extends ValueNotifier<TasksState> {
  TaskVnStore(this.repository) : super(TasksState.initialState());

  final TaskRepository repository;

  Future<void> doneTask(TaskModel task) async {
    late TaskStatus newStatus;

    if (task.status == TaskStatus.closed) {
      newStatus = TaskStatus.open;
    } else {
      newStatus = TaskStatus.closed;
    }
    final newTask = task.copyWith(status: newStatus, isDone: !task.isDone);

    await repository.updateTasks(newTask);

    await getTasks(task.initialDate);
  }

  Future<void> archiveTask(TaskModel task) async {
    late TaskStatus newStatus;

    if (task.status == TaskStatus.archived) {
      if (task.isDone) {
        newStatus = TaskStatus.closed;
      } else {
        newStatus = TaskStatus.open;
      }
    } else {
      newStatus = TaskStatus.archived;
    }

    final newTask = task.copyWith(status: newStatus);
    await repository.updateTasks(newTask);

    await getTasks(task.initialDate);
  }

  Future<void> getTasks(DateTime date) async {
    value = LoadingTasksVnState();

    await Future.delayed(const Duration(seconds: 3));

    //value = ErrorTasksVnState('Error'); //simulação de mensagem de erro

    //await Future.delayed(const Duration(seconds: 3));
    try {
      // final random = Random();

      // final tasks = List.generate(50, (index) {
      //   final now = DateTime.now();
      //   final initialDate = now.add(Duration(days: random.nextInt(25) - 1));
      //   return TaskModel(
      //     id: index,
      //     title: 'Title $index',
      //     description: 'Description $index',
      //     initialDate: initialDate,
      //     endDate: initialDate.add(Duration(minutes: index * 2)),
      //     isDone: index.isEven,
      //     status: TaskStatus.values[index % 3],
      //   );
      // });
      final tasks = await repository.getTasks();
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
