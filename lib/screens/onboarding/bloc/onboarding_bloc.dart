import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:baxify/screens/onboarding/bloc/onboarding_event.dart';
import 'package:baxify/screens/onboarding/bloc/onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  int pageIndex = 0;

  final pageController = PageController(initialPage: 0);
  OnboardingBloc() : super(const OnboardingInitial()) {
    on<PageChangedEvent>((event, emit) async {
      if (pageIndex == 2) {
        emit(const ToAuthState());
      } else {
        pageIndex += 1;
        pageController.animateToPage(
          pageIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
        emit(PageChangedState(counter: pageIndex));

        if (kDebugMode) {
          print(pageIndex);
        }
      }
    });

    on<PageSwipedEvent>((event, emit) async {
      pageIndex = event.index;
      PageChangedState(counter: pageIndex);
      if (kDebugMode) {
        print(pageIndex);
      }
      emit(state);
    });
  }
}
