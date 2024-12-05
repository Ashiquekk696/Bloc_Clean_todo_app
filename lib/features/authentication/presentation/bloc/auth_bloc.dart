import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_clean_app/features/authentication/domain/entity/user_entity.dart';
import 'package:todo_bloc_clean_app/features/authentication/domain/usecases/logout_usecase.dart';

import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/signup_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignupUseCase signup;
  final LoginUseCase login;
  final LogOutUseCase logOut;
  AuthBloc(this.signup, this.login,this.logOut)
      : super(const AuthState(isLoginSelected: true, isLoading: false)) {
    on<ShowLoginEvent>((event, emit) => emit(state.copyWith(isLoginSelected: true)));
    on<ShowRegisterEvent>((event, emit) => emit(state.copyWith(isLoginSelected: false,successMessage: null,errorMessage: null)));
 
    on<SignUpEvent>((event, emit) async {
      await _handleSignUp(event, emit);
    });
 
    on<LoginEvent>((event, emit) async {
      await _handleLogin(event, emit);
    });
     on<LogOutEvent>((event, emit) async {
      await logout(event, emit);
    });
  }

  Future<void> _handleSignUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true,));
    try {
      await signup.execute(User(
        firstName: event.firstName,
        lastName: event.lastName,
        email: event.email,
        password: event.password,
      ));
      emit(state.copyWith(
        isLoading: false,
        successMessage: 'Registration successful',
      ));
    } catch (error) {
      emit(state.copyWith(
        isLoading: false,
        successMessage: "",
        errorMessage: error.toString(),
      ));
    }
  }

  Future<void> _handleLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      await login.execute(User(email: event.email, password: event.password));
      emit(state.copyWith(
        isLoading: false,
        successMessage: 'Login successful',
      ));
    } catch (error) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: error.toString(),
      ));
    }
  }

  Future<void> logout(LogOutEvent event, Emitter<AuthState> emit)async{
    
   await logOut.execute();
  }
}
