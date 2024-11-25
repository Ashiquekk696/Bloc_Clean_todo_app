class Validator {
  /// Validates if the given email is in the correct format.
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

    if (!emailRegex.hasMatch(email)) {
      return 'Enter a valid email';
    }

    return null; // Validation passed
  }

  /// Validates if the password is provided.
static String? validatePassword(String? password, String? confirmPassword) {
  if (password == null || confirmPassword == null) {
    return 'Both fields are required';
  } else if (password != confirmPassword) {
    return 'Passwords do not match';
  }
  return null;  
}
static String? isRequired(String? fieldName, ) {
  if (fieldName == null ||fieldName =="") {
    return 'Field is required';
  }  
  return null; // Return null if validation is successful
}

}
