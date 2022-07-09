import 'package:baxify/services/auth/auth_provider.dart';
import 'package:baxify/services/auth/auth_user.dart';
import 'package:baxify/services/auth/firebase_auth_provider.dart';

class AuthService implements AuthProvider {
  final AuthProvider provider;

  AuthService(
    this.provider,
  );
  factory AuthService.firebase() {
    return AuthService(FirebaseAuthProvider());
  }
  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
    required String displayName,
    required String phonenumber,
  }) =>
      provider.createUser(
          email: email,
          password: password,
          displayName: displayName,
          phonenumber: phonenumber);

  @override
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<void> logOut() => provider.logOut();

  @override
  Future<AuthUser> login({
    required String email,
    required String password,
  }) =>
      provider.login(email: email, password: password);

  @override
  Future<void> sendEmailVerification() => provider.sendEmailVerification();

  @override
  Future<void> initialized() async {
    return provider.initialized();
  }
}
