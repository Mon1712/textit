
class Validator {

  Validator._();

  /// Validator for Empty Text
  static String? validateEmptyText(String fieldName,String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  /// Validator for Name field
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    } else if (value.length < 3) {
      return 'Name must be at least 3 characters long';
    } else if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
      return 'Name must only contain letters';
    }
    return null;
  }

  /// Validator for Phone Number field
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    } else if (!RegExp(r"^[0-9]{10}$").hasMatch(value)) {
      return 'Phone number must be exactly 10 digits';
    }
    return null;
  }

  /// Validator for Email field
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(r"^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$").hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  /// Validator for Password field
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    } else if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$').hasMatch(value)) {
      return 'Password must contain letters and numbers';
    }
    return null;
  }

  /// Validator for Confirm Password field
  static String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Confirm password is required';
    } else if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  /// Validator for status
  static String? validateStatus(String? value) {
    if (value == null || value.isEmpty) {
      return 'Status cannot be empty';
    }
    return null;
  }

  /// Validator for date of birth
  static String? validateDob(String? value) {
    if (value == null || value.isEmpty) {
      return 'Date of birth is required';
    }
    return null;
  }

  static String? validateUsername(String? value) {
    final regex = RegExp(r'^[a-zA-Z0-9._]+$');
    if (value == null || value.isEmpty) {
      return 'Username cannot be empty';
    } else if (!regex.hasMatch(value)) {
      return 'Username can only contain letters, numbers, periods, and underscores';
    }
    return null;
  }
}
