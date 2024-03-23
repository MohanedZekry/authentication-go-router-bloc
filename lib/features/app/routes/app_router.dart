import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

abstract class AppRouter {
  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: false,
    navigatorKey: _rootNavigatorKey,
    routes: [],
  );
  static GoRouter get router => _router;

}