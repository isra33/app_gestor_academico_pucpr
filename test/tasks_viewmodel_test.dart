import 'package:flutter_test/flutter_test.dart'; 
import 'package:app_gestor_academico_pucpr/viewmodels/tasks_viewmodel.dart';
import 'package:app_gestor_academico_pucpr/repositories/in_memory_app_repository.dart';

void main() {
  late TasksViewModel viewModel;

  setUp(() {
    viewModel = TasksViewModel(InMemoryAppRepository());
  });

  test('deve alternar o status da tarefa', () {
    final initialValue = viewModel.tasks.first.isDone;

    viewModel.toggleTask(viewModel.tasks.first.id);

    expect(viewModel.tasks.first.isDone, !initialValue);
  });
}