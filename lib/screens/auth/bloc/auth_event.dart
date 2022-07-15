import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class AuthEvent {
  const AuthEvent();
}

class AuthEventInitialized extends AuthEvent {
  const AuthEventInitialized();
}

class AuthEventEmailVerification extends AuthEvent {
  const AuthEventEmailVerification();
}

class AuthEventLogIn extends AuthEvent {
  final String email;
  final String password;

  const AuthEventLogIn(
    this.email,
    this.password,
  );
}

class AuthEventRegister extends AuthEvent {
  final String email;
  final String password;
  final String fullName;
  final String phonenumber;

  const AuthEventRegister(
    this.email,
    this.password,
    this.fullName,
    this.phonenumber,

    //  this.id,
  );
}

class AuthEventShouldRegister extends AuthEvent {
  const AuthEventShouldRegister();
}

class AuthEventLogOut extends AuthEvent {
  const AuthEventLogOut();
}

class OnTextChangedEventSignUp extends AuthEvent {}

class OnTextChangedEventSignIn extends AuthEvent {}

class SignInPageEvent extends AuthEvent {}

class PageChangedEvent extends AuthEvent {}

class PageSwipedEvent extends AuthEvent {
  final int index;

  const PageSwipedEvent({required this.index});
}
