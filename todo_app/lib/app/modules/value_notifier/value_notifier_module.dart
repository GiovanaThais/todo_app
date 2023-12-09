import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/value_notifier/pages/add_task_vn_page.dart';
import 'package:todo_app/app/modules/value_notifier/pages/home_vn_page.dart';
import 'package:todo_app/app/modules/value_notifier/store/date_vn_store.dart';

class valueNotifierModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton((i) => DateVnStore());
  }

  @override
  void routes(r) {
    r.child('/',
        child: (context) => HomeVnPage(
              dateVnStore: Modular.get<DateVnStore>(),
            ));
    r.child('/add', child: (context) => const AddTaskVnPage());
  }
}
