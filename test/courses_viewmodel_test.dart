import 'package:flutter_test/flutter_test.dart';
 import 'package:app_gestor_academico_pucpr/viewmodels/courses_viewmodel.dart';
 import 'package:app_gestor_academico_pucpr/repositories/in_memory_app_repository.dart';

void main() {
  late CoursesViewModel viewModel;

  setUp(() {
    viewModel = CoursesViewModel(InMemoryAppRepository());
  });

  test('deve listar 3 disciplinas', () {
    expect(viewModel.courses.length, 3);
  });

  test('a primeira disciplina deve ser Arquitetura de Software', () {
    expect(viewModel.courses.first.name, 'Arquitetura de Software');
  });
}