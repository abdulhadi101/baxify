import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:baxify/const/color_constants.dart';
import 'package:baxify/main.dart';
import 'package:baxify/screens/onboarding/bloc/onboarding_bloc.dart';
import 'package:baxify/screens/onboarding/bloc/onboarding_state.dart';
import 'package:baxify/screens/onboarding/widget/onboarding_content.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.secondaryColor,
      body: _buildBody(context),
    );
  }
}

BlocProvider<OnboardingBloc> _buildBody(BuildContext context) {
  return BlocProvider<OnboardingBloc>(
    create: (BuildContext context) => OnboardingBloc(),
    child: BlocConsumer<OnboardingBloc, OnboardingState>(
      listenWhen: (_, currState) => currState is ToAuthState,
      listener: (context, state) async {
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool('showHome', true);
        //if (!mounted) return;
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) {
              return const HomePage();
            },
          ),
        );
      },
      buildWhen: (_, currState) {
        return currState is OnboardingInitial;
      },
      builder: (context, state) {
        return const OnboardingContent();
      },
    ),
  );
}
