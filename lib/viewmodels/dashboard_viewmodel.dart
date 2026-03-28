import 'package:flutter/foundation.dart';
import '../repositories/app_repository.dart';

class DashboardViewModel extends ChangeNotifier {
  final AppRepository repository;

  DashboardViewModel(this.repository);

  int get totalCourses => repository.getCourses().length;
  int get totalTasks => repository.getTasks().length;
  int get completedTasks => repository.getCompletedTasksCount();
  int get pendingTasks => repository.getPendingTasksCount();
}