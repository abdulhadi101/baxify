import 'package:baxify/const/color_constants.dart';
import 'package:baxify/const/style_constants.dart';
import 'package:baxify/screens/airtime_data/widget/airtime.dart';
import 'package:baxify/screens/airtime_data/widget/databundle.dart';
import 'package:baxify/screens/cable_tv/widget/dstv.dart';
import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';

class CableTV extends StatefulWidget {
  const CableTV({Key? key}) : super(key: key);

  @override
  State<CableTV> createState() => _CableTVState();
}

class _CableTVState extends State<CableTV> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        backgroundColor: ColorConstants.background,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: ColorConstants.textBlack,
          ),
          title: const Text(
            "Cable TV Subscription",
            style: TextStyle(color: ColorConstants.textBlack),
          ),
          elevation: 0,
          backgroundColor: ColorConstants.background,
          primary: true,
          //    backgroundColor: ColorConstants.grey,
          bottom: PreferredSize(
            preferredSize: const Size(20.0, 50),
            child: Container(
              width: MediaQuery.of(context).size.width / 1.1,
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
                      "DSTV",
                      style: tabTitleTextStyle,
                    ),
                  ),
                  Container(
                    child: Text(
                      "GOTV",
                      style: tabTitleTextStyle,
                    ),
                  ),
                  Text(
                    "StarTimes",
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
                DSTV(),
                Center(
                  child: Text("Coming Soon"),
                ),
                Center(
                  child: Text("Coming Soon"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
