import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/value_notifier/pages/add_task_vn_page.dart';
import 'package:todo_app/app/modules/value_notifier/pages/home_vn_page.dart';
import 'package:todo_app/app/modules/value_notifier/stores/date_vn_store.dart';
import 'package:todo_app/app/modules/value_notifier/stores/tasks_vn_store.dart';

class ValueNotifierModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(() => DateVnStore());
    i.addLazySingleton(() => TaskVnStore());
  }

  @override
  void routes(r) {
    r.child('/',
        child: (context) => HomeVnPage(
              dateVnStore: Modular.get<DateVnStore>(),
              taskVnStore: Modular.get<TaskVnStore>(),
            ));
    r.child('/add', child: (context) => const AddTaskVnPage());
  }
}
