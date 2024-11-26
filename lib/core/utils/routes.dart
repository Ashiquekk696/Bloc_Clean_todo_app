 
import 'package:flutter/material.dart';
import 'package:kinzy_todo_app/features/authentication/presentation/ui/auth_screen.dart';
import 'package:kinzy_todo_app/features/tasks/presentation/ui/task_screen.dart';
 
 

class AppRoutes {
  static const String auth = "/";
  static const String task = "/task";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case auth:

      // case home:
      return MaterialPageRoute(builder: (_) => const AuthScreen());

      case task:

      
      return MaterialPageRoute(builder: (_) => const HomeScreen());
      
       default:
         return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Page not found!'),
        ),
      ),
    );
  }
}
