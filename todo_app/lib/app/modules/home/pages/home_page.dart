import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/core/services/local_storage/i_local_storage_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.get<ILocalStorageService>().load();

    return Scaffold(
      appBar: AppBar(title: const Text('State Management')),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () => Modular.to.pushNamed('/vn/'),
              child: const Text('ValueNotifier'))
        ],
      )),
    );
  }
}
