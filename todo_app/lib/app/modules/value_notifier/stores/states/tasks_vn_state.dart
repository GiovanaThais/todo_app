import 'package:todo_app/app/core/models/task_model.dart';

class TasksState {
  const TasksState(
      {required this.allTasks,
      required this.currentDateTasks,
      required this.filteredTasks,
      required this.tasksStatus});

  factory TasksState.initialState() {
    return const TasksState(
      allTasks: [],
      currentDateTasks: [],
      filteredTasks: [],
      tasksStatus: null,
    );
  }

  final List<TaskModel> allTasks;
  final List<TaskModel> currentDateTasks;
  final List<TaskModel> filteredTasks;
  final TaskStatus? tasksStatus;

  int get openedCount => _filterLength(TaskStatus.open);
  int get closedCount => _filterLength(TaskStatus.closed);
  int get archivedCount => _filterLength(TaskStatus.archived);

  int _filterLength(TaskStatus status) {
    final tasks = currentDateTasks.where((e) => e.status == status);
    return tasks.length;
  }

  TasksState copyWith({
    List<TaskModel>? allTasks,
    List<TaskModel>? currentDateTasks,
    List<TaskModel>? filteredTasks,
    TaskStatus? tasksStatus,
  }) {
    return TasksState(
      allTasks: allTasks ?? this.allTasks,
      currentDateTasks: currentDateTasks ?? this.currentDateTasks,
      filteredTasks: filteredTasks ?? this.filteredTasks,
      tasksStatus: tasksStatus,
    );
  }
}

class ErrorTasksVnState extends TasksState {
  const ErrorTasksVnState(this.message)
      : super(
          allTasks: const [],
          filteredTasks: const [],
          currentDateTasks: const [],
          tasksStatus: null,
        );
  final String message;
}

class LoadingTasksVnState extends TasksState {
  LoadingTasksVnState()
      : super(
          allTasks: [],
          filteredTasks: [],
          currentDateTasks: [],
          tasksStatus: null,
        );
}
