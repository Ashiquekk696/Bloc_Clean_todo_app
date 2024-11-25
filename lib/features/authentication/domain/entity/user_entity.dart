class User {
  final String? firstName;
  final String? lastName;
  final String? password;
  final String? email;

  User(
      {required this.password,
      required this.email,
      this.firstName,
      this.lastName});
}
