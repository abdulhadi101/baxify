import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:baxify/services/auth/auth_provider.dart';
import 'package:baxify/screens/auth/bloc/auth_event.dart';
import 'package:baxify/screens/auth/bloc/auth_state.dart';
import 'package:baxify/services/validation_service.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  static final fullNameController = TextEditingController();
  static final phonenumberController = TextEditingController();
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();
  static final confirmPasswordController = TextEditingController();

  final emailControllerSignIn = TextEditingController();
  final passwordControllerSignIn = TextEditingController();

  bool isButtonEnabled = false;
  int pageIndex = 0;

  final pageController = PageController(initialPage: 0);

  AuthBloc(
    AuthProvider provider,
  ) : super(
          const AuthStateUninitialized(isLoading: false),
        ) {
    // send email verfication

    on<AuthEventEmailVerification>((event, emit) async {
      await provider.sendEmailVerification();
      emit(state);
    });

    // Register
    on<AuthEventRegister>((event, emit) async {
      emit(const AuthStateRegistering(
        exception: null,
        isLoading: true,
        loadingText: "Please wait while we log you in",
      ));

      final email = event.email;
      final password = event.password;
      final fullName = event.fullName;
      final phonenumber = event.phonenumber;
      if (checkValidatorsOfTextField()) {
        try {
          await provider.createUser(
              email: email,
              password: password,
              phonenumber: phonenumber,
              displayName: fullName);

          await provider.sendEmailVerification();
          emit(const AuthStateVerification(isLoading: false));
        } on Exception catch (e) {
          emit(AuthStateRegistering(
            exception: e,
            isLoading: false,
          ));
        }
      } else {
        emit(const ShowErrorState(isLoading: false));
      }
    });

    // Initialiazed Events
    on<AuthEventInitialized>(
      (event, emit) async {
        await provider.initialized();
        final user = provider.currentUser;
        if (user == null) {
          emit(
            const AuthStateLoggedOut(
              exception: null,
              isLoading: false,
            ),
          );
        } else if (!user.isEmailVerified) {
          emit(
            const AuthStateVerification(isLoading: false),
          );
        } else {
          emit(
            AuthStateLoggedIn(
              user: user,
              isLoading: false,
            ),
          );
        }
      },
    );
    on<AuthEventLogIn>(
      (event, emit) async {
        if (_checkValidatorsOfTextField()) {
          emit(
            const AuthStateLoggedOut(
                exception: null,
                isLoading: true,
                loadingText: "Please wait while we log you in"),
          );

          final email = event.email;
          final password = event.password;

          try {
            final user = await provider.login(
              email: email,
              password: password,
            );

            if (!user.isEmailVerified) {
              emit(
                const AuthStateLoggedOut(
                  exception: null,
                  isLoading: false,
                ),
              );
              emit(
                const AuthStateVerification(
                  isLoading: false,
                ),
              );
            } else {
              emit(
                const AuthStateLoggedOut(
                  exception: null,
                  isLoading: false,
                ),
              );
              emit(
                AuthStateLoggedIn(
                  user: user,
                  isLoading: false,
                ),
              );
            }
          } on Exception catch (e) {
            emit(
              AuthStateLoggedOut(
                exception: e,
                isLoading: false,
              ),
            );
          }
        } else {
          emit(const ShowErrorStateLogin(isLoading: false));
        }
      },
    );
    on<AuthEventLogOut>(
      (event, emit) async {
        try {
          await provider.logOut();
          emit(
            const AuthStateLoggedOut(exception: null, isLoading: false),
          );
        } on Exception catch (e) {
          emit(
            AuthStateLoggedOut(exception: e, isLoading: false),
          );
        }
      },
    );

    on<OnTextChangedEventSignUp>((event, emit) {
      if (isButtonEnabled != checkIfSignUpButtonEnabled()) {
        isButtonEnabled = checkIfSignUpButtonEnabled();

        emit(
          SignUpButtonEnableChangedState(
              isEnable: isButtonEnabled, isLoading: false),
        );
      }
    });

    on<OnTextChangedEventSignIn>((event, emit) {
      if (isButtonEnabled != _checkIfSignInButtonEnabled()) {
        isButtonEnabled = _checkIfSignInButtonEnabled();

        emit(SignInButtonEnableChangedState(
            isEnable: isButtonEnabled, isLoading: false));
      }
    });

    on<SignInPageEvent>((event, emit) {
      emit(const SignInPageState(isLoading: false));
    });
  }

  bool checkIfSignUpButtonEnabled() {
    return fullNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty;
  }

  bool checkValidatorsOfTextField() {
    return ValidationService.name(fullNameController.text) &&
        ValidationService.email(emailController.text) &&
        ValidationService.password(passwordController.text) &&
        ValidationService.confirmPassword(
            passwordController.text, confirmPasswordController.text);
  }

  bool _checkIfSignInButtonEnabled() {
    return emailControllerSignIn.text.isNotEmpty &&
        passwordControllerSignIn.text.isNotEmpty;
  }

  bool _checkValidatorsOfTextField() {
    return ValidationService.email(emailControllerSignIn.text) &&
        ValidationService.password(passwordControllerSignIn.text);
  }
}
