import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:baxify/const/color_constants.dart';
import 'package:baxify/const/path_constants.dart';
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
                color: ColorConstants.primaryColor,
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Color.fromARGB(255, 135, 144, 220),
                    ColorConstants.primaryColor,
                  ],
                  stops: [
                    0.55,
                    1,
                  ],
                ),
              ),
              height: 300.0,
              child: Image.asset(
                PathConstants.onboarding3,
                fit: BoxFit.cover,
              ),
            ),
            Container(
                decoration: const BoxDecoration(
                  color: ColorConstants.secondaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: const SizedBox(height: 20)),
            Container(
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
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
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
            MyTextField(
              myLabel: TextConstants.fullNamePlaceholder,
              placeholder: TextConstants.fullNamePlaceholder,
              controller: AuthBloc.firstNameController,
              textInputAction: TextInputAction.next,
              errorText: TextConstants.usernameErrorText,
              isError: state is ShowErrorState
                  ? !ValidationService.username(
                      AuthBloc.firstNameController.text)
                  : false,
              onTextChanged: () {
                bloc.add(OnTextChangedEventSignUp());
              },
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            MyTextField(
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
            MyTextField(
              myLabel: TextConstants.phonenumberPlaceholder,
              placeholder: TextConstants.phonenumberPlaceholder,
              controller: AuthBloc.phonenumberController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.phone,
              errorText: TextConstants.usernameErrorText,
              isError: state is ShowErrorState
                  ? !ValidationService.username(
                      AuthBloc.firstNameController.text)
                  : false,
              onTextChanged: () {
                bloc.add(OnTextChangedEventSignUp());
              },
            ),
            const SizedBox(height: 20),
            MyTextField(
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
            MyTextField(
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
                title: TextConstants.continueto,
                isEnabled: state is SignUpButtonEnableChangedState
                    ? state.isEnable
                    : false,
                onTap: () {
                  FocusScope.of(context).unfocus();

                  context.read<AuthBloc>().add(PageChangedEvent());
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
