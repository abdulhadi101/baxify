import 'package:flutter/material.dart';
import 'package:baxify/screens/auth/bloc/auth_bloc.dart';
import 'package:baxify/screens/auth/bloc/auth_state.dart';
import 'package:baxify/screens/auth/widget/sign_in_content.dart';
import 'package:baxify/services/auth/auth_exceptions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:baxify/utility/dialogs/error_dialog.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) async {
          if (state is AuthStateLoggedOut) {
            if (state.exception is UserNotFoundAuthException) {
              await showErrorDialog(context, "User not Found");
            } else if (state.exception is WrongPasswordAuthException) {
              await showErrorDialog(context, "Wrong Credential");
            } else if (state.exception is GenericAuthException) {
              await showErrorDialog(context, "Authentication Error");
            }
          }
        },
        child: const SignInContent());
  }
}
