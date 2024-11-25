import 'package:flutter/material.dart';
import 'package:kinzy_todo_app/core/utils/navigation_service.dart';
import 'package:kinzy_todo_app/features/authentication/domain/entity/user_entity.dart';
import 'package:kinzy_todo_app/features/authentication/domain/repository/auth_repository.dart';
 

class SignupUseCase {
  final AuthRepository authRepository;

  SignupUseCase(this.authRepository);

  Future<void> execute(User user) async {
    try {
      await authRepository.register(user);
      ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!).showSnackBar(
        const SnackBar(content: Text("Registered succesfully !!"),duration: Duration(seconds: 5),),
      );
    } catch (e) {
      rethrow;  
    }
  }
}
