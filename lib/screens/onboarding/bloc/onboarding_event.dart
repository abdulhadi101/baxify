import 'package:flutter/foundation.dart';

@immutable
abstract class OnboardingEvent {
  const OnboardingEvent();
}

class PageChangedEvent extends OnboardingEvent {
  const PageChangedEvent();
}

class PageSwipedEvent extends OnboardingEvent {
  final int index;

  const PageSwipedEvent({required this.index});
}
