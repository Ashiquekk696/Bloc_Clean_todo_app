import 'package:flutter/material.dart';
import 'package:todo_bloc_clean_app/core/utils/navigation_service.dart';
import 'package:todo_bloc_clean_app/core/utils/routes.dart';
import 'package:todo_bloc_clean_app/features/authentication/domain/entity/user_entity.dart';
import 'package:todo_bloc_clean_app/features/authentication/domain/repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  Future<void> execute(User user) async {
    try {
      bool userExists = await authRepository.login(user);
      if (userExists == true) {
        Navigator.of(NavigationService.navigatorKey.currentContext!)
            .pushReplacementNamed(AppRoutes.task);
      } else {
        ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!)
            .showSnackBar(
          const SnackBar(content: Text("User not found !!!"),duration: Duration(seconds: 5),),
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
