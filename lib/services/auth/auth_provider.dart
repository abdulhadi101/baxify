import 'package:baxify/services/auth/auth_user.dart';

abstract class AuthProvider {
  AuthUser? get currentUser;

  Future<AuthUser> createUser({
    required String email,
    required String password,
    required String displayName,
    required String phonenumber,
  });

  Future<AuthUser> login({
    required String email,
    required String password,
  });

  Future<void> logOut();
  Future<void> sendEmailVerification();
  Future<void> initialized();
}
