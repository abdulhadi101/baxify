import 'dart:math';
import 'dart:convert';

class RandomStringGenerator {
  static String getBase64RandomString(int length) {
    var random = Random.secure();
    var values = List<int>.generate(length, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }
}
