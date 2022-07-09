import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/foundation.dart';

@immutable
class AuthUser {
  
  final String email;
  final bool isEmailVerified;
  final String id;
  final String displayName;
  final String  phonenumber;

  const AuthUser(
      {required this.id,
      required this.isEmailVerified,
      required this.email,
     required this.displayName,
      required this.phonenumber});
  factory AuthUser.fromFirebase(User user) => AuthUser(
        isEmailVerified: user.emailVerified,
        email: user.email!,
        id: user.uid,
        phonenumber: user.phoneNumber!,
        displayName: user.displayName!,
      );
}
