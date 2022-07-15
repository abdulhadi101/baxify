import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:baxify/const/color_constants.dart';
import 'package:baxify/helpers/loading/loading_screen.dart';
import 'package:baxify/screens/auth/bloc/auth_bloc.dart';
import 'package:baxify/screens/auth/bloc/auth_event.dart';
import 'package:baxify/screens/auth/bloc/auth_state.dart';
import 'package:baxify/screens/auth/page/sign_in_page.dart';
import 'package:baxify/screens/auth/page/sign_up_page.dart';
import 'package:baxify/screens/auth/page/verify_email.dart';
import 'package:baxify/screens/onboarding/page/onboarding_page.dart';
import 'package:baxify/screens/dashboard/page/dashboard_page.dart';
import 'package:baxify/services/auth/firebase_auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  runApp(
    MyApp(showHome: showHome),
  );
}

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({Key? key, required this.showHome}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baxify',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorConstants.primaryColor,
        unselectedWidgetColor: ColorConstants.textColorGrey,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: showHome ? const HomePage() : const OnboardingPage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(FirebaseAuthProvider()),
      child: const _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const AuthEventInitialized());
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isLoading) {
          LoadingScreen().show(
              context: context,
              text: state.loadingText ?? "Please wait a moment");
        } else {
          LoadingScreen().hide();
        }
      },
      builder: (context, state) {
        if (state is AuthStateLoggedIn) {
          return const DashboardPage();
        } else if (state is AuthStateVerification) {
          return const VerifyEmailView();
        } else if (state is AuthStateLoggedOut) {
          return const SignUpPage();
        } else if (state is AuthStateRegistering) {
          return const SignUpPage();
        } else if (state is ShowErrorState) {
          return const SignUpPage();
        } else if (state is ShowErrorStateLogin) {
          return const SignInPage();
        } else if (state is SignUpButtonEnableChangedState) {
          return const SignUpPage();
        } else if (state is SignInButtonEnableChangedState) {
          return const SignInPage();
        } else if (state is SignInPageState) {
          return const SignInPage();
        } else {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
