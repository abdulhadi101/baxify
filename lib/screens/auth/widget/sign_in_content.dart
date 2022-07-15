import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:baxify/const/color_constants.dart';
import 'package:baxify/const/text_constants.dart';
import 'package:baxify/const/path_constants.dart';
import 'package:baxify/screens/auth/bloc/auth_bloc.dart';
import 'package:baxify/screens/auth/bloc/auth_event.dart';
import 'package:baxify/screens/auth/bloc/auth_state.dart';
import 'package:baxify/services/validation_service.dart';
import 'package:baxify/screens/common_widgets/my_button.dart';
import 'package:baxify/screens/common_widgets/my_text_field.dart';

class SignInContent extends StatelessWidget {
  const SignInContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //  height: double.infinity,
      // width: double.infinity,
      color: ColorConstants.background,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              _createMainData(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createMainData(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: SizedBox(
        height: height - 1 - MediaQuery.of(context).padding.bottom,
        child: Container(
          color: ColorConstants.primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: RadialGradient(colors: [
                    ColorConstants.primaryColor,
                    ColorConstants.primaryColor,
                  ], stops: [
                    0.55,
                    1,
                  ]),
                ),
                height: 300.0,
                child: Image.asset(
                  PathConstants.onboarding3,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                  decoration: const BoxDecoration(
                    color: ColorConstants.background,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: const SizedBox(height: 20)),
              Container(
                //height: double.infinity,
                color: ColorConstants.background,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),
                    _createHeader(),
                    const SizedBox(height: 50),
                    _createForm(context),
                    const SizedBox(height: 20),
                    _createSignInButton(context),
                    const SizedBox(height: 20),
                    Center(child: _createForgotPasswordButton(context)),
                    const SizedBox(height: 40),
                    Center(child: _signUpButton(context)),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createHeader() {
    return const Center(
      child: Text(
        TextConstants.login,
        style: TextStyle(
          color: ColorConstants.textColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _createForm(BuildContext context) {
    final bloc = BlocProvider.of<AuthBloc>(context);
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (_, currState) => currState is ShowErrorStateLogin,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyTextField2(
              myLabel: TextConstants.emailPlaceholder,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              placeholder: TextConstants.emailPlaceholder,
              controller: bloc.emailControllerSignIn,
              errorText: TextConstants.emailErrorText,
              isError: state is ShowErrorStateLogin
                  ? !ValidationService.email(bloc.emailControllerSignIn.text)
                  : false,
              onTextChanged: () {
                bloc.add(OnTextChangedEventSignIn());
              },
            ),
            const SizedBox(height: 20),
            MyTextField2(
              myLabel: TextConstants.password,
              placeholder: TextConstants.passwordPlaceholderSignIn,
              controller: bloc.passwordControllerSignIn,
              errorText: TextConstants.passwordErrorText,
              isError: state is ShowErrorStateLogin
                  ? !ValidationService.password(
                      bloc.passwordControllerSignIn.text)
                  : false,
              obscureText: true,
              onTextChanged: () {
                bloc.add(OnTextChangedEventSignIn());
              },
            ),
          ],
        );
      },
    );
  }

  Widget _createForgotPasswordButton(BuildContext context) {
    return GestureDetector(
      child: const Padding(
        padding: EdgeInsets.only(left: 21),
        child: Text(
          TextConstants.forgotPassword,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: ColorConstants.textBlack,
          ),
        ),
      ),
      onTap: () {
        FocusScope.of(context).unfocus();
        //  bloc.add(ForgotPasswordTappedEvent());
      },
    );
  }

  Widget _createSignInButton(BuildContext context) {
    final bloc = BlocProvider.of<AuthBloc>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<AuthBloc, AuthState>(
        buildWhen: (_, currState) =>
            currState is SignInButtonEnableChangedState,
        builder: (context, state) {
          return MyButton(
            
            title: TextConstants.login,
            isEnabled: state is SignInButtonEnableChangedState
                ? state.isEnable
                : false,
            onTap: () async {
              final email = bloc.emailControllerSignIn.text;
              final password = bloc.passwordControllerSignIn.text;

              FocusScope.of(context).unfocus();
              context.read<AuthBloc>().add(AuthEventLogIn(
                    email,
                    password,
                  ));
            },
          );
        },
      ),
    );
  }

  Widget _signUpButton(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return TextButton(
            onPressed: () {
              context.read<AuthBloc>().add(const AuthEventInitialized());
            },
            child: const Text(
              TextConstants.signUp,
              style: TextStyle(color: ColorConstants.textBlack),
            ));
      },
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
