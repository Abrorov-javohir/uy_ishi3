

import 'package:uy_ishi/model/task.dart';
import 'package:uy_ishi/services/task_service.dart';

class TasksRepositories {
  final Tasksservices taskHttpService = Tasksservices();

  Future<List<Task>> getTasks() async {
    return taskHttpService.getTasks();
  }

  Future<Task?> addTask(String title, String date, bool isDone) async {
    return taskHttpService.addTask(title, date, isDone);
  }

  Future<void> editTasks(
      String id, String title, String date, bool isDone) async {
    return taskHttpService.editTasks(id, title, date, isDone);
  }

  Future<void> isdelete(String id) async {
    return taskHttpService.isDelete(id);
  }
}