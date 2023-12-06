import 'package:flutter/material.dart';
import 'package:todo_app/app/components/filter_list_components.dart';
import 'package:todo_app/app/widgets/filter_item_widget.dart';
import 'package:todo_app/app/widgets/task_card_widget.dart';
import '../widgets/header_widget.dart';
import 'package:todo_app/app/widgets/home_app_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                // onAddTap: () {},
                // subtitle: 'Hoje',
                // title: 'Tarefas de Hoje'
                ),
            const SizedBox(
              height: 20,
            ),
            const FilterListComponents(),
            const SizedBox(
              height: 20,
            ),
            TaskCardWidget(
              isDone: true,
              description: 'Description',
              endDate: DateTime.now(),
              initialDate: DateTime.now(),
              onTap: () {},
              title: 'Title',
            ),
            TaskCardWidget(
              isDone: false,
              description: 'Description',
              endDate: DateTime.now(),
              initialDate: DateTime.now(),
              onTap: () {},
              title: 'Title',
            ),
          ],
        ),
      ),
    );
  }
}
