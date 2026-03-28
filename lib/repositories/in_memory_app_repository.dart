import 'app_repository.dart';
import '../models/course.dart';
import '../models/task_item.dart';

class InMemoryAppRepository implements AppRepository {
  final List<Course> _courses = const [
    Course(
      id: '1',
      name: 'Arquitetura de Software',
      professor: 'Prof. Mariana Alves',
      workloadHours: 40,
    ),
    Course(
      id: '2',
      name: 'Desenvolvimento Mobile',
      professor: 'Prof. Carlos Lima',
      workloadHours: 32,
    ),
    Course(
      id: '3',
      name: 'Testes e Qualidade',
      professor: 'Prof. Juliana Rocha',
      workloadHours: 24,
    ),
  ];

  final List<TaskItem> _tasks = [
    TaskItem(
      id: '1',
      title: 'Entregar atividade de arquitetura',
      courseName: 'Arquitetura de Software',
      dueDate: '05/04/2026',
      isDone: false,
    ),
    TaskItem(
      id: '2',
      title: 'Gravar apresentação do app',
      courseName: 'Desenvolvimento Mobile',
      dueDate: '08/04/2026',
      isDone: true,
    ),
    TaskItem(
      id: '3',
      title: 'Revisar testes unitários',
      courseName: 'Testes e Qualidade',
      dueDate: '10/04/2026',
      isDone: false,
    ),
  ];

  @override
  List<Course> getCourses() => List.unmodifiable(_courses);

  @override
  List<TaskItem> getTasks() => List.unmodifiable(_tasks);

  @override
  void toggleTaskStatus(String taskId) {
    final task = _tasks.firstWhere((item) => item.id == taskId);
    task.isDone = !task.isDone;
  }

  @override
  int getCompletedTasksCount() {
    return _tasks.where((task) => task.isDone).length;
  }

  @override
  int getPendingTasksCount() {
    return _tasks.where((task) => !task.isDone).length;
  }
}