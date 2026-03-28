import '../core/di/injection.dart';
import 'package:flutter/material.dart';
import '../widgets/app_bottom_nav.dart';
import '../viewmodels/tasks_viewmodel.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  late final TasksViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<TasksViewModel>();
    viewModel.addListener(_refreshPage);
  }

  @override
  void dispose() {
    viewModel.removeListener(_refreshPage);
    super.dispose();
  }

  void _refreshPage() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final tasks = viewModel.tasks;
    final completedCount = tasks.where((task) => task.isDone).length;
    final pendingCount = tasks.where((task) => !task.isDone).length;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
        centerTitle: true,
      ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 2),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              theme.colorScheme.primary.withOpacity(0.04),
              theme.colorScheme.surface,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.secondaryContainer,
                    theme.colorScheme.primaryContainer.withOpacity(0.85),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _TaskSummaryBox(
                          title: 'Concluídas',
                          value: completedCount.toString(),
                          icon: Icons.check_circle_rounded,
                          iconColor: Colors.green,
                          backgroundColor: Colors.white.withOpacity(0.75),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _TaskSummaryBox(
                          title: 'Pendentes',
                          value: pendingCount.toString(),
                          icon: Icons.pending_actions_rounded,
                          iconColor: Colors.orange,
                          backgroundColor: Colors.white.withOpacity(0.75),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            ...tasks.map(
              (task) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Card(
                  elevation: 4,
                  shadowColor: Colors.black.withOpacity(0.08),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: CheckboxListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                    value: task.isDone,
                    activeColor: Colors.green,
                    checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    secondary: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: task.isDone
                            ? Colors.green.shade50
                            : Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(
                        task.isDone
                            ? Icons.task_alt_rounded
                            : Icons.assignment_late_rounded,
                        color: task.isDone ? Colors.green : Colors.orange,
                      ),
                    ),
                    title: Text(
                      task.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        decoration:
                            task.isDone ? TextDecoration.lineThrough : null,
                        color: task.isDone ? Colors.grey.shade600 : null,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        'Disciplina: ${task.courseName}\nPrazo: ${task.dueDate}',
                        style: TextStyle(
                          height: 1.4,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                    isThreeLine: true,
                    onChanged: (_) {
                      viewModel.toggleTask(task.id);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TaskSummaryBox extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;

  const _TaskSummaryBox({
    required this.title,
    required this.value,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Icon(icon, color: iconColor, size: 28),
          const SizedBox(height: 8),
          Text(
            value,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}