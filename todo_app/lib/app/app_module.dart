import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/home/home_module.dart';
import 'package:todo_app/app/modules/value_notifier/value_notifier_module.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.module(
      '/home',
      module: HomeModule(),
    );
    r.module('/vn', module: valueNotifierModule());
  }
}
