import 'app.dart';
import 'core/di/injection.dart';
import 'package:flutter/material.dart';

void main() {
  setupDependencies();
  runApp(const PosGraduacaoApp());
}