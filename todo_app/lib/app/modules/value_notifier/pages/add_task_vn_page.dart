import 'package:flutter/material.dart';
import 'package:todo_app/app/core/controllers/form_controller.dart';
import 'package:todo_app/app/core/widgets/text_field_widget.dart';

import '../../../components/add_task_form_components.dart';
import '../controllers/form_vn_controller.dart';

class AddTaskVnPage extends StatelessWidget {
  const AddTaskVnPage({super.key, required this.controller});

  final FormVnController controller;

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
