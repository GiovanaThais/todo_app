import 'package:flutter/material.dart';
import 'package:todo_app/app/components/filter_list_components.dart';
import 'package:todo_app/app/components/task_list_components.dart';
import 'package:todo_app/app/pages/add_task_page.dart';
import '../widgets/header_widget.dart';
import 'package:todo_app/app/widgets/home_app_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void navigateToForm() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const AddTaskPage();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBarWidget(
        onNextTap: () {},
        onPreviousTap: () {},
        title: const Text('Hoje'),
        onTitleTap: (date) {},
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          children: [
            HeaderWidget(
                onAddTap: () {
                  navigateToForm();
                },
                subtitle: 'Hoje',
                title: 'Tarefas de Hoje'),
            const SizedBox(
              height: 20,
            ),
            const FilterListComponents(),
            const SizedBox(
              height: 20,
            ),
            Expanded(child: const TaskListComponent()),
          ],
        ),
      ),
    );
  }
}
