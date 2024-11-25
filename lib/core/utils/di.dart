import 'package:get_it/get_it.dart';
import 'package:kinzy_todo_app/features/authentication/data/datasources/auth_datasource.dart';
import 'package:kinzy_todo_app/features/authentication/domain/repository/auth_repository.dart';
import 'package:kinzy_todo_app/features/authentication/domain/usecases/login_usecase.dart';
import 'package:kinzy_todo_app/features/authentication/domain/usecases/logout_usecase.dart';
import 'package:kinzy_todo_app/features/authentication/domain/usecases/signup_usecase.dart';
import 'package:kinzy_todo_app/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:kinzy_todo_app/features/tasks/data/todo_repo_impl.dart';
import 'package:kinzy_todo_app/features/tasks/domain/todo_repo.dart';
import 'package:kinzy_todo_app/features/tasks/presentation/bloc/task_bloc.dart';

import '../../features/authentication/data/repository/auth_repository.dart';

class ServiceLocator {
  static final getIt = GetIt.instance;
  static Future injectDependencies() async {
    initAuthDependencies();
  }

  static void initAuthDependencies() {
    getIt.registerLazySingleton<AuthDataSource>(() => AuthDataSource());

    getIt.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(getIt<AuthDataSource>()));
    getIt.registerSingleton<SignupUseCase>(
        SignupUseCase(getIt<AuthRepository>()));
          getIt.registerSingleton<LogOutUseCase>(
        LogOutUseCase(getIt<AuthRepository>()));
    getIt
        .registerSingleton<LoginUseCase>(LoginUseCase(getIt<AuthRepository>()));

    getIt.registerSingleton<AuthBloc>(
        AuthBloc(getIt<SignupUseCase>(), getIt<LoginUseCase>(), getIt<LogOutUseCase>()));
       
    getIt.registerLazySingleton<TodoRepo>(() => TodoRepoImpl());
   getIt.registerSingleton<TaskBloc>(TaskBloc(  getIt<TodoRepo>()));
  }
}
