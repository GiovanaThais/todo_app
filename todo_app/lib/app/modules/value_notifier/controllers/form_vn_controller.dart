import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/core/modules/value_notifier/pages/add_task_page.dart';
import 'package:todo_app/app/modules/value_notifier/stores/add_task_vn_store.dart';
import 'package:todo_app/app/modules/value_notifier/stores/date_vn_store.dart';
import 'package:todo_app/app/modules/value_notifier/stores/tasks_vn_store.dart';

import '../../../core/controllers/form_controller.dart';
import '../../../core/models/add_task_param.dart';

class FormVnController extends FormController {
  FormVnController(
      {required this.addTaskVnStore,
      required TaskVnStore taskVnStore,
      required DateVnStore dateVnStore})
      : _taskVnStore = taskVnStore,
        _dateVnStore = dateVnStore; //construtor nomeado com classe privada

  final AddTaskVnStore addTaskVnStore;
  final DateVnStore _dateVnStore;
  final TaskVnStore _taskVnStore;

  @override
  Future<void> save(AddTaskParam param) async {
    await addTaskVnStore.add(param as AddTaskPage);

    if (addTaskVnStore.isSuccess) {
      _dateVnStore.changeDate(param.initialDate);
      unawaited(_taskVnStore.getTasks(param.initialDate));
      Modular.to.pop();
    }
  }
}
