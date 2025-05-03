class AuthValidationService {
  String? validateEmail(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Please enter your email';
    }
    // Add email format validation
    return null;
  }

  String? validatePassword(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Please enter your password';
    }
    if ((value?.length ?? 0) < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? validateName(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Please enter your name';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Please enter your phone number';
    }
    return null;
  }
}
