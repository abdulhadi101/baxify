import 'package:baxify/const/color_constants.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:baxify/screens/auth/bloc/auth_bloc.dart';
import 'package:baxify/screens/auth/bloc/auth_event.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: const BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.greenAccent, Colors.amber])),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Card(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
                    child: Text(
                      "We have sent you an Email verification check your mail, If you havent received the verfication please press the  Send Email Verification botton below",
                      style: TextStyle(
                        color: ColorConstants.textBlack,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(
                          const AuthEventEmailVerification(),
                        );
                  },
                  child: const Text("Send Email Verification"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    context.read<AuthBloc>().add(
                          SignInPageEvent(),
                        );
                  },
                  child: const Text("Back To Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
