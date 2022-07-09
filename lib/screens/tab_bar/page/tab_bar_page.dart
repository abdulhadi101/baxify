//import 'package:visionarymomas/screens/workouts/page/workouts_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:baxify/screens/tab_bar/bloc/tab_bar_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TabBarBloc>(
      create: (BuildContext context) => TabBarBloc(),
      child: BlocConsumer<TabBarBloc, TabBarState>(
        listener: (context, state) {},
        buildWhen: (_, currState) =>
            currState is TabBarInitial || currState is TabBarItemSelectedState,
        builder: (context, state) {
          return const Scaffold(backgroundColor: Colors.white, body: Center()
              // bottomNavigationBar: _createdBottomTabBar(context),
              );
        },
      ),
    );
  }
}
