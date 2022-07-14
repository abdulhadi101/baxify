//import 'package:visionarymomas/screens/workouts/page/workouts_page.dart';

import 'package:baxify/const/color_constants.dart';
import 'package:baxify/screens/airtime_data/page/airtime_data.dart';
import 'package:baxify/services/api/api_airtime.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
            TextButton(
                onPressed: () {
                 var response =  AirtimeService(queryparam: {
                    'phone': '07067058995',
                    'amount': '200',
                    'service_type': 'mtn',
                    'plan': 'prepaid',
                    'agentId': '207',
                    'agentReference': 'dsd3erdfdhgs',
                  }).buyAirtime();
                  print("I have been clickec");

                   
                },
                child: const Text("Click Me"))
              
          ],
        )
        // bottomNavigationBar: _createdBottomTabBar(context),
        );
  }
}
