import 'package:flutter/material.dart';
import 'package:kinzy_todo_app/core/utils/routes.dart';

import '../../../../core/utils/navigation_service.dart';
import '../repository/auth_repository.dart';

class LogOutUseCase {
  final AuthRepository authRepository;

  LogOutUseCase(this.authRepository);

  Future<void> execute() async {
    try {
    await authRepository.logout(); 
     Navigator.of(NavigationService.navigatorKey.currentContext!)
            .pushReplacementNamed(AppRoutes.auth);
    } catch (e) {
      rethrow;
    }
  }
}
