import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:baxify/const/color_constants.dart';
import 'package:baxify/const/style_constants.dart';
import 'package:baxify/const/text_constants.dart';
import 'package:baxify/screens/common_widgets/my_button.dart';
import 'package:baxify/screens/common_widgets/my_text_field.dart';
import 'package:baxify/screens/auth/bloc/auth_bloc.dart';
import 'package:baxify/screens/auth/bloc/auth_event.dart';
import 'package:baxify/screens/auth/bloc/auth_state.dart';
import 'package:baxify/services/validation_service.dart';

class SignUpContent extends StatefulWidget {
  const SignUpContent({Key? key}) : super(key: key);

  @override
  State<SignUpContent> createState() => _SignUpContentState();
}

class _SignUpContentState extends State<SignUpContent> {
  bool isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AuthBloc>(context);
    return SafeArea(
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: bloc.pageController,
          children: [
            GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: ColorConstants.secondaryColor,
                child: Stack(
                  children: [
                    _createMainData(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createMainData(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            //height: double.infinity,
            //  height: hw,
            color: ColorConstants.secondaryColor,
            child: Column(
              children: [
                _createTitle(),
                const SizedBox(height: 20),
                const SizedBox(height: 20),
                createForm(context),
                const SizedBox(height: 40),
                _createContinueButton(context),
                const SizedBox(height: 40),
                Center(child: _loginButton(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _createTitle() {
    return Text(
      TextConstants.signUp,
      style: headingTextStyle1,
      textAlign: TextAlign.center,
    );
  }

  Widget createForm(BuildContext context) {
    final bloc = BlocProvider.of<AuthBloc>(context);
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Column(
          children: [
            MyTextField2(
              myLabel: TextConstants.fullNamePlaceholder,
              placeholder: TextConstants.fullNamePlaceholder,
              controller: AuthBloc.fullNameController,
              textInputAction: TextInputAction.next,
              errorText: TextConstants.nameErrorText,
              isError: state is ShowErrorState
                  ? !ValidationService.name(AuthBloc.fullNameController.text)
                  : false,
              onTextChanged: () {
                bloc.add(OnTextChangedEventSignUp());
              },
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            MyTextField2(
              myLabel: TextConstants.emailPlaceholder,
              placeholder: TextConstants.emailPlaceholder,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              controller: AuthBloc.emailController,
              errorText: TextConstants.emailErrorText,
              isError: state is ShowErrorState
                  ? !ValidationService.email(AuthBloc.emailController.text)
                  : false,
              onTextChanged: () {
                bloc.add(OnTextChangedEventSignUp());
              },
            ),
            const SizedBox(height: 20),
            MyTextField2(
              myLabel: TextConstants.phonenumberPlaceholder,
              placeholder: TextConstants.phonenumberPlaceholder,
              controller: AuthBloc.phonenumberController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.phone,
              errorText: TextConstants.phoneErrorText,
              isError: state is ShowErrorState
                  ? !ValidationService.phonenumber(
                      AuthBloc.phonenumberController.text)
                  : false,
              onTextChanged: () {
                bloc.add(OnTextChangedEventSignUp());
              },
            ),
            const SizedBox(height: 20),
            MyTextField2(
              myLabel: TextConstants.password,
              placeholder: TextConstants.passwordPlaceholder,
              obscureText: true,
              isError: state is ShowErrorState
                  ? !ValidationService.password(
                      AuthBloc.passwordController.text)
                  : false,
              textInputAction: TextInputAction.next,
              controller: AuthBloc.passwordController,
              errorText: TextConstants.passwordErrorText,
              onTextChanged: () {
                bloc.add(OnTextChangedEventSignUp());
              },
            ),
            const SizedBox(height: 20),
            MyTextField2(
              myLabel: TextConstants.password,
              placeholder: TextConstants.confirmPasswordPlaceholder,
              obscureText: true,
              isError: state is ShowErrorState
                  ? !ValidationService.confirmPassword(
                      AuthBloc.passwordController.text,
                      AuthBloc.confirmPasswordController.text)
                  : false,
              controller: AuthBloc.confirmPasswordController,
              errorText: TextConstants.confirmPasswordErrorText,
              onTextChanged: () {
                bloc.add(OnTextChangedEventSignUp());
              },
            ),
          ],
        );
      },
    );
  }

  Widget _createContinueButton(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return MyButton2(
                title: TextConstants.signUp,
                isEnabled: state is SignUpButtonEnableChangedState
                    ? state.isEnable
                    : false,
                onTap: () {
                  final email = AuthBloc.emailController.text;
                  final password = AuthBloc.passwordController.text;
                  final fullName = AuthBloc.fullNameController.text;

                  final phonenumber = AuthBloc.phonenumberController.text;

                  FocusScope.of(context).unfocus();

                  context.read<AuthBloc>().add(AuthEventRegister(
                        email,
                        password,
                        fullName,
                        phonenumber,
                      ));
                });
          },
        ));
  }

  Widget _loginButton(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return TextButton(
            onPressed: () {
              context.read<AuthBloc>().add(SignInPageEvent());
            },
            child: const Text(
              TextConstants.login,
              style: TextStyle(color: ColorConstants.textColor),
            ));
      },
    );
  }
}
