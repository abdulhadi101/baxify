//import 'package:visionarymomas/screens/workouts/page/workouts_page.dart';

import 'package:baxify/const/color_constants.dart';
import 'package:baxify/screens/airtime_data/page/airtime_data.dart';
import 'package:baxify/services/api/api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.background,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
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
                            return const AirtimeData();
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
          ],
        )
        // bottomNavigationBar: _createdBottomTabBar(context),
        );
  }
}
