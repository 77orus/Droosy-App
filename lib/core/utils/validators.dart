import 'package:droosy_app/core/utils/app_regex.dart';

class FormValidators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!AppRegex.isEmailValid(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    if (!AppRegex.isPasswordValid(value)) {
      return 'Please enter a valid password';
    }
    return null;
  }

  static String? validateFullName(String? value){
    if(value == null || value.isEmpty){
      return 'Full name is required';
    } 
    if(value.length < 3){
      return 'Full name must be at least 3 characters';
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Confirm password is required';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }
}




