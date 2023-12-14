import 'package:flutter/material.dart';
import 'package:todo_app/app/core/controllers/form_controller.dart';

import '../../../components/add_task_form_components.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key, required this.controller});
  final FormController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova tarefa'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: AddTaskFormComponent(
          formController: controller,
        ),
      ),
    );
  }
}
