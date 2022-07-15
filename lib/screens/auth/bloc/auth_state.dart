import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart' show immutable;
import 'package:baxify/services/auth/auth_user.dart';

@immutable
abstract class AuthState {
  final bool isLoading;
  final String? loadingText;
  const AuthState(
      {required this.isLoading, this.loadingText = "Please wait a momment"});
}

class AuthStateUninitialized extends AuthState {
  const AuthStateUninitialized({required bool isLoading})
      : super(isLoading: isLoading);
}

class AuthStateRegistering extends AuthState with EquatableMixin {
  final Exception? exception;

  const AuthStateRegistering({
    required this.exception,
    required isLoading,
    String? loadingText,
  }) : super(
          isLoading: isLoading,
          loadingText: loadingText,
        );

  @override
  List<Object?> get props => [exception, isLoading];
}

class SignUpButtonEnableChangedState extends AuthState {
  final bool isEnable;

  const SignUpButtonEnableChangedState({
    required this.isEnable,
    required isLoading,
  }) : super(isLoading: isLoading);
}

class SignInButtonEnableChangedState extends AuthState {
  final bool isEnable;

  const SignInButtonEnableChangedState({
    required this.isEnable,
    required isLoading,
  }) : super(isLoading: isLoading);
}

class ShowErrorState extends AuthState {
  const ShowErrorState({
    required bool isLoading,
  }) : super(isLoading: isLoading);
}

class ShowErrorStateLogin extends AuthState {
  const ShowErrorStateLogin({
    required bool isLoading,
  }) : super(isLoading: isLoading);
}

class AuthStateLoggedIn extends AuthState {
  final AuthUser user;
  const AuthStateLoggedIn({
    required this.user,
    required bool isLoading,
  }) : super(isLoading: isLoading);
}

class AuthStateVerification extends AuthState {
  const AuthStateVerification({required bool isLoading})
      : super(isLoading: isLoading);
}

class SignInPageState extends AuthState {
  const SignInPageState({required bool isLoading})
      : super(isLoading: isLoading);
}

class AuthStateLoggedOut extends AuthState with EquatableMixin {
  final Exception? exception;
  const AuthStateLoggedOut({
    required this.exception,
    required bool isLoading,
    String? loadingText,
  }) : super(
          isLoading: isLoading,
          loadingText: loadingText,
        );

  @override
  List<Object?> get props => [exception, isLoading];
}
