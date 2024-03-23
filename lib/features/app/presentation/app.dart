import 'package:flutter/material.dart';
import '../routes/app_router.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'GoRouterAuth',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
