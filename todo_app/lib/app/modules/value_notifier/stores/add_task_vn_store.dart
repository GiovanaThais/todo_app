import 'package:flutter/material.dart';
import 'package:todo_app/app/core/models/add_task_param.dart';
import 'package:todo_app/app/core/modules/value_notifier/pages/add_task_page.dart';
import 'package:todo_app/app/core/repositories/task_repository.dart';
import 'package:todo_app/app/modules/value_notifier/stores/states/add_task_vn_state.dart';

class AddTaskVnStore extends ValueNotifier<AddTaskVnState> {
  AddTaskVnStore(this.repository) : super(const InitialAddTaskVnState());

  final TaskRepository repository;

  bool get isSuccess => value is SuccessAddTaskVnState;
  Future<void> add(AddTaskParam param) async {
    value = const LoadingAddTaskVnState();

    await Future.delayed(const Duration(seconds: 3));

    await repository.addTask(param);

    value = const SuccessAddTaskVnState();
  }
}
