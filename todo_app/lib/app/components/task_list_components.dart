import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:todo_app/app/core/theme/color_extension.dart';
import 'package:todo_app/app/modules/value_notifier/stores/states/tasks_state.dart';
import 'package:todo_app/app/modules/value_notifier/stores/tasks_vn_store.dart';

import '../core/widgets/task_card_widget.dart';

class TaskListComponent extends StatelessWidget {
  const TaskListComponent({super.key, required this.taskVnStore});

  final TaskVnStore taskVnStore;

  @override
  Widget build(BuildContext context) {
    final colorExtension = Theme.of(context).extension<ColorExtension>()!;
    return ValueListenableBuilder(
        valueListenable: taskVnStore,
        builder: (_, state, __) {
          if (state is LoadingTasksVnState) {
            return Center(
              child: Shimmer.fromColors(
                  baseColor: colorExtension.shimmerBaseColor,
                  highlightColor: colorExtension.shimmerHighLightColor,
                  child: ListView.separated(
                      itemCount: 50,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (_, __) {
                        return Container(
                          width: double.infinity,
                          height: 120,
                          decoration: BoxDecoration(
                              color: colorExtension.shimmerBaseColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8))),
                        );
                      })),
            );
          }
          if (state is ErrorTasksVnState) {
            return Center(
              child: Text(state.message),
            );
          }

          return ListView.separated(
            itemCount: state.filteredTasks.length,
            separatorBuilder: (_, __) => const SizedBox(
              height: 8,
            ),
            itemBuilder: (_, index) {
              final task = state.filteredTasks.elementAt(index);
              return TaskCardWidget(
                isDone: task.isDone,
                description: task.description,
                initialDate: task.initialDate,
                endDate: task.endDate,
                onTap: () {},
                title: task.title,
              );
            },
          );
        });
  }
}
