import './../config/config.dart';

class FormValidator {
  static String? validateInputField(String? inputFiled, String name) {
    if (inputFiled != null && inputFiled.isEmpty) return "Missing $name field!";
    if (inputFiled != null && inputFiled.length < 2) return 'At least 2 characters!';
    return null;
  }

  static String? validateNumberField(String? inputFiled, String name) {
    if (inputFiled != null && inputFiled.isEmpty) return "Missing $name field!";
    String number = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(number);
    if (!regExp.hasMatch(inputFiled.toString())) {
      return '${name.capitalizeFirstofEach} not valid number!';
    }
    return null;
  }

  static String? validateEmail(String? email) {
    if (email != null && email.isEmpty) return "Missing email address!";
    String pattern = r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,})$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(email.toString())) {
      return "Email address not valid.";
    }
    return null;
  }

  static String? validatePassword({String? value, int passNumber = 8}) {
    if (value != null && value.isEmpty) return 'Please complete the password field.';
    if (value != null && value.length < passNumber) return 'Password must contain at least $passNumber characters.';
    return null;
  }

  static String? validatePasswordConfirmation(String? confirmPassword, String password) {
    if (confirmPassword != null && confirmPassword.isEmpty) return 'Please complete the password field.';
    if (confirmPassword != password) return 'The passwords do not match.';
    return null;
  }
}
