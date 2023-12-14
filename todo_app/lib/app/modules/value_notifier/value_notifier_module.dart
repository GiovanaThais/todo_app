import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/value_notifier/pages/add_task_vn_page.dart';
import 'package:todo_app/app/modules/value_notifier/pages/home_vn_page.dart';
import 'package:todo_app/app/modules/value_notifier/stores/add_task_vn_store.dart';
import 'package:todo_app/app/modules/value_notifier/stores/date_vn_store.dart';
import 'package:todo_app/app/modules/value_notifier/stores/tasks_vn_store.dart';

import 'controllers/form_vn_controller.dart';

class ValueNotifierModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(() => DateVnStore());
    i.addLazySingleton(() => TaskVnStore(i()));
    i.add(() => AddTaskVnStore(i()));
    i.add(() => FormVnController(
        addTaskVnStore: i(),
        taskVnStore: i(),
        dateVnStore: i(),
        overlayService: i()));
  }

  @override
  void routes(r) {
    r.child('/',
        child: (context) => HomeVnPage(
              dateVnStore: Modular.get<DateVnStore>(),
              taskVnStore: Modular.get<TaskVnStore>(),
            ));
    r.child('/add',
        child: (context) => AddTaskVnPage(
              controller: Modular.get<FormVnController>(),
            ));
  }
}
