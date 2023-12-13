import 'package:flutter/material.dart';
import 'package:todo_app/app/core/modules/value_notifier/pages/add_task_page.dart';

class AddTaskVnStore extends ValueNotifier<bool> {
  AddTaskVnStore(super.value);

  bool get isSuccess => value;
  Future<void> add(AddTaskPage param) async {
    value = true;
  }
}
