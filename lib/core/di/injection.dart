import 'package:get_it/get_it.dart';
import '../../viewmodels/tasks_viewmodel.dart';
import '../../repositories/app_repository.dart';
import '../../viewmodels/courses_viewmodel.dart';
import '../../viewmodels/dashboard_viewmodel.dart';
import '../../repositories/in_memory_app_repository.dart';

final GetIt getIt = GetIt.instance;

void setupDependencies() {
  if (getIt.isRegistered<AppRepository>()) return;

  getIt.registerLazySingleton<AppRepository>(() => InMemoryAppRepository());

  getIt.registerFactory<DashboardViewModel>(
    () => DashboardViewModel(getIt<AppRepository>()),
  );

  getIt.registerFactory<CoursesViewModel>(
    () => CoursesViewModel(getIt<AppRepository>()),
  );

  getIt.registerFactory<TasksViewModel>(
    () => TasksViewModel(getIt<AppRepository>()),
  );
}