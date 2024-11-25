class AuthState {
  final bool isLoginSelected;
 final bool isLoading;
  

 final String ?errorMessage;
final String? successMessage;
  const AuthState({required this.isLoginSelected,required this.isLoading,  this.successMessage,  this.errorMessage});

  AuthState copyWith({bool? isLoginSelected,bool? isLoading,String? successMessage,String? errorMessage}) {
    return AuthState(
      isLoginSelected: isLoginSelected ?? this.isLoginSelected,
      isLoading:  isLoading??this.isLoading,
      successMessage: successMessage??this.successMessage,
      errorMessage: errorMessage??this.errorMessage);
  }
}
