class ValidationService {
  static bool name(String text) {
    return text.length > 3;
  }

  static bool phonenumber(String text) {
    return text.length > 9;
  }

  static bool email(String text) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text);
    return emailValid;
  }

  static bool password(String text) {
    return text.length >= 6;
  }

  static bool confirmPassword(String password, String confirmPassword) {
    return password == confirmPassword;
  }
}
