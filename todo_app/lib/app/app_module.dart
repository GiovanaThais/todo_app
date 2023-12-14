import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/core/repositories/task_repository.dart';
import 'package:todo_app/app/core/services/local_storage/hive_local_storage_service.dart';
import 'package:todo_app/app/core/services/overlay/asuka_overlay_service.dart';
import 'package:todo_app/app/core/services/overlay/i_overlay_service.dart';
import 'package:todo_app/app/modules/home/home_module.dart';
import 'package:todo_app/app/modules/value_notifier/value_notifier_module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<IOverlayService>(
      (i) => AsukaOverLayService(),
      onDispose: (value) => value.dispose(),
    );
    i.addLazySingleton((i) => TaskRepository(i()));
    i.addSingleton((i) => HiveLocalStorageService());
  }

  @override
  void routes(r) {
    r.module(
      '/home',
      module: HomeModule(),
    );
    r.module('/vn', module: ValueNotifierModule());
  }
}
