import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:baxify/const/color_constants.dart';
import 'package:baxify/const/data_constants.dart';
import 'package:baxify/screens/onboarding/bloc/onboarding_bloc.dart';
import 'package:baxify/screens/onboarding/bloc/onboarding_event.dart';
import 'package:baxify/screens/onboarding/bloc/onboarding_state.dart';

class OnboardingContent extends StatefulWidget {
  const OnboardingContent({Key? key}) : super(key: key);

  @override
  State<OnboardingContent> createState() => _OnboardingContentState();
}

class _OnboardingContentState extends State<OnboardingContent> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<OnboardingBloc>(context);
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: _createPageView(bloc.pageController, bloc),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Container(
                child: _createStatic(bloc),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createPageView(PageController controller, OnboardingBloc bloc) {
    return PageView(
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: DataConstants.onboardingTiles,
      onPageChanged: (index) {
        bloc.add(PageSwipedEvent(index: index));
      },
    );
  }

  Widget _createStatic(OnboardingBloc bloc) {
    return Column(
      children: [
        BlocBuilder<OnboardingBloc, OnboardingState>(
          buildWhen: (_, currState) => currState is PageChangedState,
          builder: (context, state) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: DotsIndicator(
                    dotsCount: 3,
                    position: bloc.pageIndex.toDouble(),
                    decorator: const DotsDecorator(
                      color: Colors.grey,
                      activeColor: ColorConstants.primaryColor,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        const Spacer(),
        BlocBuilder<OnboardingBloc, OnboardingState>(
          buildWhen: (_, currState) => currState is PageChangedState,
          builder: (context, state) {
            final percent = _getPercent(bloc.pageIndex);
            return TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: percent),
                duration: const Duration(seconds: 1),
                builder: (context, value, _) => CircularPercentIndicator(
                      radius: 50,
                      backgroundColor: ColorConstants.primaryColor,
                      progressColor: Colors.white,
                      percent: 1 - value,
                      center: Material(
                        shape: const CircleBorder(),
                        color: ColorConstants.primaryColor,
                        child: RawMaterialButton(
                          shape: const CircleBorder(),
                          onPressed: () {
                            context
                                .read<OnboardingBloc>()
                                .add(const PageChangedEvent());
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Icon(
                              Icons.east_rounded,
                              size: 28.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ));
          },
        ),
      ],
    );
  }

  double _getPercent(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return 0.33;
      case 1:
        return 0.66;
      case 2:
        return 1;
      
      default:
        return 0;
    }
  }
}
