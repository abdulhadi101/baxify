import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:baxify/screens/auth/bloc/auth_bloc.dart';
import 'package:baxify/screens/auth/bloc/auth_state.dart';

import 'package:baxify/screens/auth/widget/sign_up_content.dart';

import 'package:baxify/services/auth/auth_exceptions.dart';
import 'package:baxify/utility/dialogs/error_dialog.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) async {
          if (state is AuthStateRegistering) {
            if (state.exception is WeakPasswordAuthException) {
              await showErrorDialog(context, "Weak Password");
            } else if (state.exception is EmailInUseAuthException) {
              await showErrorDialog(context, "Email Already in Use");
            } else if (state.exception is InvalidEmailAuthException) {
              await showErrorDialog(context, "Invalid Email");
            } else if (state.exception is GenericAuthException) {
              await showErrorDialog(context, "Failed to Register");
            }
          }
        },
        child: const SignUpContent());
  }
}
