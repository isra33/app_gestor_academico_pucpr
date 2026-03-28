class TaskItem {
  final String id;
  final String title;
  final String courseName;
  final String dueDate;
  bool isDone;

  TaskItem({
    required this.id,
    required this.title,
    required this.courseName,
    required this.dueDate,
    this.isDone = false,
  });
}