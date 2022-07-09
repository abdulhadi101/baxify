import 'package:flutter/foundation.dart';

@immutable
abstract class OnboardingState {
  const OnboardingState();
}

class OnboardingInitial extends OnboardingState {
  const OnboardingInitial();
}

class PageChangedState extends OnboardingState {
  final int counter;

  const PageChangedState({
    required this.counter,
  });
}

class ToAuthState extends OnboardingState {
  const ToAuthState();
}
