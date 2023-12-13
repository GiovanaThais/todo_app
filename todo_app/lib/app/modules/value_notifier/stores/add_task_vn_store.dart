import 'package:flutter/material.dart';
import 'package:todo_app/app/core/modules/value_notifier/pages/add_task_page.dart';
import 'package:todo_app/app/modules/value_notifier/stores/states/add_task_vn_state.dart';

class AddTaskVnStore extends ValueNotifier<bool> {
  AddTaskVnStore() : super(const InitialAddTaskVnState() as bool);

  bool get isSuccess => value is SuccessAddTaskVnState;
  Future<void> add(AddTaskPage param) async {
    value = const LoadingAddTaskVnState() as bool; //rever

    await Future.delayed(const Duration(seconds: 3));

    value = const SuccessAddTaskVnState() as bool;
  }
}
