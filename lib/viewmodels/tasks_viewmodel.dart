import '../models/task_item.dart';
import 'package:flutter/foundation.dart';
import '../repositories/app_repository.dart';

class TasksViewModel extends ChangeNotifier {
  final AppRepository repository;

  TasksViewModel(this.repository);

  List<TaskItem> get tasks => repository.getTasks();

  void toggleTask(String taskId) {
    repository.toggleTaskStatus(taskId);
    notifyListeners();
  }
}