import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/core/modules/value_notifier/pages/add_task_page.dart';
import 'package:todo_app/app/core/services/overlay/i_overlay_service.dart';
import 'package:todo_app/app/modules/value_notifier/stores/add_task_vn_store.dart';
import 'package:todo_app/app/modules/value_notifier/stores/date_vn_store.dart';
import 'package:todo_app/app/modules/value_notifier/stores/tasks_vn_store.dart';

import '../../../core/controllers/form_controller.dart';
import '../../../core/models/add_task_param.dart';

class FormVnController extends FormController {
  FormVnController({
    required this.addTaskVnStore,
    required TaskVnStore taskVnStore,
    required DateVnStore dateVnStore,
    required IOverlayService overlayService,
  })  : _taskVnStore = taskVnStore,
        _dateVnStore = dateVnStore,
        _overlayService =
            overlayService; //construtor nomeado com classe privada

  final AddTaskVnStore addTaskVnStore;
  final DateVnStore _dateVnStore;
  final TaskVnStore _taskVnStore;
  final IOverlayService _overlayService;

  @override
  Future<void> save(AddTaskParam param) async {
    _overlayService.show();

    await addTaskVnStore.add(param);

    if (addTaskVnStore.isSuccess) {
      _dateVnStore.changeDate(param.initialDate);
      unawaited(_taskVnStore.getTasks(param.initialDate));
      Modular.to.pop();
    }
    await _overlayService.hide();
  }
}
