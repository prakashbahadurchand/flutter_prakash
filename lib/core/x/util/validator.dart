import '../config/app_globals.dart';

class Validator {
  final RegExp regexForMobileNumber = RegExp(
      r'^(?:(?:9)[7][4-5]|(?:9)[8][0-2]|(?:9)[8][4|6]|(?:9)[8][5]|(?:9)[8][8])[0-9]{7}$');

  String? validateEmail(String? input) {
    String? message;
    if (input == null || input.isEmpty) {
      message = 'required*';
    } else {
      final RegExp emailRegExp =
          // RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
          RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
      if (!emailRegExp.hasMatch(input)) {
        message = AppGlobals.isEn ? 'Invalid email format' : 'इमेल मान्य छैन';
      }
    }
    return message;
  }

  String? validatePassword(String? input) {
    if (input == null || input.isEmpty) {
      return 'required*';
    }
    if (input.length < 8) {}
    return AppGlobals.isEn
        ? 'Password must be at least 8 characters'
        : 'पासवर्ड कम्तिमा आठ वर्णको हुनुपर्छ';
    //if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
    /*if (!RegExp(r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(input)) {
      return localeValue == 'ne'
          ? 'पासवर्डमा कम्तिमा एक अक्षर, एक संख्या र एक विशेष वर्ण हुनुपर्छ'
          : 'Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character';
    }*/
    return null;
  }

  String? validateEmpty(dynamic input) => input.isEmpty ? 'required*' : null;

  String? validatePhone(String? input) {
    String? message;
    if (input == null || input.isEmpty) {
      message = 'required*';
    } else if (!RegExp(
            r'^(?:(?:9)[7][4-5]|(?:9)[8][0-2]|(?:9)[8][4|6]|(?:9)[8][5]|(?:9)[8][8])[0-9]{7}$')
        .hasMatch(input)) {
      message =
          AppGlobals.isEn ? 'Invalid phone number' : 'फोन नम्बर मान्य छैन';
    }
    return message;
  }

  bool isNumberValid(String text) =>
      text.isNotEmpty &&
      text.length == 10 &&
      regexForMobileNumber.hasMatch(text);

  String? validatePhoneAndEmail(String? input) {
    if (input == null || input.isEmpty) {
      return 'required*';
    }

    final isEmail = input.contains('@');
    final isPhone = input.length == 10 &&
        RegExp(r'^(?:(?:9)[7][4-5]|(?:9)[8][0-2]|(?:9)[8][4|6]|(?:9)[8][5]|(?:9)[8][8])[0-9]{7}$')
            .hasMatch(input);

    if (isEmail &&
        !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
            .hasMatch(input)) {
      return AppGlobals.isEn ? 'Invalid email format' : 'इनपुट मान्य छैन';
    }

    if (isPhone && !RegExp(r'^\d{10}$').hasMatch(input)) {
      return AppGlobals.isEn ? 'Invalid phone number' : 'फोन नम्बर मान्य छैन';
    }

    if (!isEmail && !isPhone) {
      return AppGlobals.isEn ? 'Invalid input' : 'इनपुट मान्य छैन';
    }

    return null;
  }
}
