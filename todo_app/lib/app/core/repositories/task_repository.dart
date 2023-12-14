import 'package:todo_app/app/app_widget.dart';
import 'package:todo_app/app/core/models/add_task_param.dart';
import 'package:todo_app/app/core/models/task_model.dart';
import 'package:todo_app/app/core/services/local_storage/i_local_storage_service.dart';

class TaskRepository {
  const TaskRepository(this._localStorageService);

  final ILocalStorageService _localStorageService;

  static const _key = 'task';

  Future<void> addTask(AddTaskParam param) async {
    final data = {
      'title': param.title,
      'description': param.description,
      'initialDate': param.initialDate.millisecondsSinceEpoch,
      'endDate': param.endDate.millisecondsSinceEpoch,
      'isDone': false,
      'status': TaskStatus.open.name,
    };
    await _localStorageService.add(_key, data);
  }

  Future<List<TaskModel>> getTasks() async {
    final data = await _localStorageService.getAll(_key);
    final tasks = data.map(TaskModel.fromMap).toList();

    return tasks;
  }

  Future<void> updateTasks(TaskModel task) async {
    await _localStorageService.update(_key, task.id, task.toMap());
  }
}
