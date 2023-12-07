import 'package:flutter/material.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova tarefa'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          Text('teste test'),
        ]),
      ),
    );
  }
}
