abstract class AuthEvent {}

class ShowLoginEvent extends AuthEvent {}

class ShowRegisterEvent extends AuthEvent {}

class SignUpEvent extends AuthEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String? confirmPassword;

  SignUpEvent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    this.confirmPassword,
  });
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({
    required this.email,
    required this.password,
  });
}
class LogOutEvent extends AuthEvent {
 
}