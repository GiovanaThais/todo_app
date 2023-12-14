import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todo_app/app/core/models/task_model.dart';

import '../../../../core/widgets/filter_item_widget.dart';
import '../../stores/tasks_vn_store.dart';

class FilterListComponents extends StatelessWidget {
  const FilterListComponents({super.key, required this.taskVnStore});

  final TaskVnStore taskVnStore;

  void filterTask(TaskStatus status) {
    taskVnStore.filterTasksByStatus(status);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: taskVnStore,
        builder: (_, state, __) {
          return SizedBox(
            height: 20,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                FilterItemWidget(
                  title: 'Todas',
                  isSelected: state.tasksStatus == null,
                  notificationCount: 32,
                  onTap: taskVnStore.clearStatusFilter,
                ),
                SizedBox(
                  width: 6,
                ),
                const VerticalDivider(),
                SizedBox(
                  width: 6,
                ),
                FilterItemWidget(
                  title: 'Abertas',
                  isSelected: state.tasksStatus == TaskStatus.open,
                  notificationCount: state.openedCount,
                  onTap: () => filterTask(TaskStatus.open),
                ),
                SizedBox(
                  width: 12,
                ),
                FilterItemWidget(
                  title: 'Fechadas',
                  isSelected: state.tasksStatus == TaskStatus.closed,
                  notificationCount: state.closedCount,
                  onTap: () => filterTask(TaskStatus.closed),
                ),
                SizedBox(
                  width: 12,
                ),
                FilterItemWidget(
                  title: 'Arquivadas',
                  isSelected: state.tasksStatus == TaskStatus.archived,
                  notificationCount: state.archivedCount,
                  onTap: () => filterTask(TaskStatus.archived),
                ),
              ],
            ),
          );
        });
  }
}
