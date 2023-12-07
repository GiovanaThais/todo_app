import 'package:flutter/material.dart';
import 'package:todo_app/app/widgets/text_field_widget.dart';

import '../components/add_task_form_components.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova tarefa'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: AddTaskFormComponent(),
      ),
    );
  }
}
