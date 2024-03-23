import 'package:flutter/material.dart';
import 'package:go_router_authentication/features/app/presentation/app.dart';
import 'infrastructure/di/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const AppScreen());
}