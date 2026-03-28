import '../models/course.dart';
import 'package:flutter/foundation.dart';
import '../repositories/app_repository.dart';

class CoursesViewModel extends ChangeNotifier {
  final AppRepository repository;

  CoursesViewModel(this.repository);

  List<Course> get courses => repository.getCourses();
}