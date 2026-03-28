import '../models/course.dart';
import '../models/task_item.dart';

abstract class AppRepository {
  List<Course> getCourses();
  List<TaskItem> getTasks();
  void toggleTaskStatus(String taskId);
  int getCompletedTasksCount();
  int getPendingTasksCount();
}