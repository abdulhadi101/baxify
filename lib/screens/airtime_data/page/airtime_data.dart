import 'package:baxify/const/color_constants.dart';
import 'package:baxify/const/style_constants.dart';
import 'package:baxify/enums/menu_action.dart';
import 'package:baxify/screens/airtime_data/widget/airtime.dart';
import 'package:baxify/screens/airtime_data/widget/databundle.dart';
import 'package:baxify/screens/auth/bloc/auth_bloc.dart';
import 'package:baxify/screens/auth/bloc/auth_event.dart';
import 'package:baxify/screens/auth/page/sign_in_page.dart';
import 'package:baxify/services/auth/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext;
import 'package:baxify/utility/dialogs/logout_dialog.dart';
import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';

class AirtimeData extends StatefulWidget {
  const AirtimeData({Key? key}) : super(key: key);

  @override
  State<AirtimeData> createState() => _AirtimeDataState();
}

class _AirtimeDataState extends State<AirtimeData> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: ColorConstants.background,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: ColorConstants.textBlack,
          ),
          title: const Text(
            "Airtime & Data",
            style: TextStyle(color: ColorConstants.textBlack),
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
          elevation: 0,
          backgroundColor: ColorConstants.background,
          primary: true,
          //    backgroundColor: ColorConstants.grey,
          bottom: PreferredSize(
            preferredSize: const Size(20.0, 50),
            child: Container(
              width: MediaQuery.of(context).size.width / 1.3,
              color: Colors.white,
              child: TabBar(
                indicatorColor: ColorConstants.primaryColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 1.3,
                // indicator: BoxDecoration(color: Colors.amberAccent),
                labelStyle: const TextStyle(color: Colors.amber),
                unselectedLabelColor: ColorConstants.grey,
                labelPadding: const EdgeInsets.symmetric(vertical: 10),
                tabs: [
                  Container(
                    child: Text(
                      "Buy Airtime",
                      style: tabTitleTextStyle,
                    ),
                  ),
                  Text(
                    "Buy Data",
                    style: tabTitleTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: const Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                AirtimeWidget(),
                DataWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
