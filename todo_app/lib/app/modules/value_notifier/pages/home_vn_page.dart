import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/value_notifier/pages/components/filter_list_components.dart';
import 'package:todo_app/app/modules/value_notifier/pages/components/task_list_components.dart';
import 'package:todo_app/app/core/shared/utils/app_formatters.dart';
import 'package:todo_app/app/modules/value_notifier/stores/date_vn_store.dart';
import 'package:todo_app/app/modules/value_notifier/stores/tasks_vn_store.dart';
import '../../../core/widgets/header_widget.dart';
import 'package:todo_app/app/core/widgets/home_app_bar_widget.dart';

class HomeVnPage extends StatefulWidget {
  const HomeVnPage(
      {super.key, required this.dateVnStore, required this.taskVnStore});

  final DateVnStore dateVnStore;
  final TaskVnStore taskVnStore;

  @override
  State<HomeVnPage> createState() => _HomeVnPageState();
}

class _HomeVnPageState extends State<HomeVnPage> {
  DateVnStore get dateStore => widget.dateVnStore;
  TaskVnStore get tasksStore => widget.taskVnStore;

  @override
  void initState() {
    super.initState();

    tasksStore.getTasks(dateStore.value);
    dateStore.addListener(reloadTasksOnDateChange);
  }

  void reloadTasksOnDateChange() {
    tasksStore.filterTasksByDate(dateStore.value);
  }

  @override
  void dispose() {
    dateStore.removeListener(reloadTasksOnDateChange);
    super.dispose();
  }

  void navigateToForm() {
    Modular.to.pushNamed('add'); //rota: /vn/add

    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return const AddTaskVnPage();
    //     },
    //   ),
    // );
  }

  String get headerTitle {
    final dayMessage = AppFormatters.dayMessage(dateStore.value);

    if (dayMessage != null) return 'Tarefas de $dayMessage';

    return 'Tarefas';
  }

  String get headerSubtitle {
    return AppFormatters.onlyDays(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: HomeAppBarWidget(
        onNextTap: dateStore.nextDate,
        onPreviousTap: dateStore.previousDate,
        onTitleTap: dateStore.changeDate,
        title: ValueListenableBuilder(
          //recebe a notificação
          valueListenable: dateStore,
          builder: (_, date, __) {
            return Text(
              AppFormatters.completeDay(date),
              style: theme.appBarTheme.titleTextStyle,
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          children: [
            ValueListenableBuilder(
                valueListenable: dateStore,
                builder: (_, date, __) {
                  return HeaderWidget(
                      onAddTap: navigateToForm,
                      title: headerTitle,
                      subtitle: headerSubtitle);
                }),
            const SizedBox(
              height: 20,
            ),
            FilterListComponents(
              taskVnStore: tasksStore,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: TaskListComponent(
              taskVnStore: tasksStore,
            )),
          ],
        ),
      ),
    );
  }
}
