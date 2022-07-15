//import 'package:visionarymomas/screens/workouts/page/workouts_page.dart';

import 'package:baxify/const/color_constants.dart';
import 'package:baxify/enums/menu_action.dart';
import 'package:baxify/screens/airtime_data/page/airtime_data.dart';
import 'package:baxify/screens/auth/bloc/auth_bloc.dart';
import 'package:baxify/screens/auth/bloc/auth_event.dart';
import 'package:baxify/screens/auth/page/sign_in_page.dart';
import 'package:baxify/screens/cable_tv/page/cable_tv.dart';
import 'package:baxify/services/api/api_service.dart';
import 'package:baxify/services/auth/auth_service.dart';
import 'package:baxify/utility/dialogs/logout_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext;
import 'package:baxify/utility/notification.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../const/style_constants.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.background,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: ColorConstants.textBlack,
          ),
          // actions: [
          //   PopupMenuButton<MenuAction>(
          //     onSelected: (value) async {
          //       switch (value) {
          //         case MenuAction.logout:
          //           final shouldLogout = await showLogOutDialog(context);
          //           if (shouldLogout) {
          //             AuthService.firebase().logOut();

          //             Navigator.of(context).pushReplacement(
          //               MaterialPageRoute(
          //                 builder: (_) {
          //                   return const SignInPage();
          //                 },
          //               ),
          //             );
          //           }
          //       }
          //     },
          //     itemBuilder: (context) {
          //       return [
          //         PopupMenuItem<MenuAction>(
          //           value: MenuAction.logout,
          //           child: Text("Log Out"),
          //         ),
          //       ];
          //     },
          //   )
          // ],
          centerTitle: true,
          title: Text(
            "Baxify",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: ColorConstants.background,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Card(
                elevation: 2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          splashColor: ColorConstants.primaryColor,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) {
                                  return const AirtimeData();
                                },
                              ),
                            );
                          },
                          child: Card(
                            color: ColorConstants.grey,
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const SizedBox(
                              height: 100,
                              width: 100,
                              child: Center(
                                child: Text(
                                  "Airtime and Data",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (kDebugMode) {
                              print("object");
                            }
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) {
                                  return const CableTV();
                                },
                              ),
                            );
                          },
                          splashColor: ColorConstants.primaryColor,
                          child: Card(
                            color: ColorConstants.grey,
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const SizedBox(
                              height: 100,
                              width: 100,
                              child: Center(
                                child: Text("Cable TV Subscrption",
                                    textAlign: TextAlign.center),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
        // bottomNavigationBar: _createdBottomTabBar(context),
        );
  }
}
