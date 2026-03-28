import 'package:flutter_test/flutter_test.dart';
import 'package:app_gestor_academico_pucpr/viewmodels/dashboard_viewmodel.dart';
import 'package:app_gestor_academico_pucpr/repositories/in_memory_app_repository.dart';
 
void main() {
  late DashboardViewModel viewModel;

  setUp(() {
    viewModel = DashboardViewModel(InMemoryAppRepository());
  });

  test('deve retornar o total correto de disciplinas', () {
    expect(viewModel.totalCourses, 3);
  });

  test('deve retornar o total correto de tarefas', () {
    expect(viewModel.totalTasks, 3);
  });
}