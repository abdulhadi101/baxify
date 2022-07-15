import 'package:baxify/const/color_constants.dart' show ColorConstants;
import 'package:baxify/const/style_constants.dart';
import 'package:flutter/material.dart';

class TabViewWidget extends StatelessWidget {
  final Widget? firstTab;
  final Widget? secondTab;
  final Widget? firstTabView;
  final Widget? secondTabView;
  final Widget? title;
  final double? titleHeight;
  const TabViewWidget({
    this.titleHeight,
    this.title,
    this.firstTab,
    this.secondTab,
    this.secondTabView,
    this.firstTabView,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: ColorConstants.grey,
        appBar: AppBar(
          title: title,
          elevation: 0,
          toolbarHeight: titleHeight ?? 0,
          primary: true,
          backgroundColor: ColorConstants.grey,
          bottom: TabBar(
            indicatorColor: ColorConstants.primaryColor,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 1.3,
            // indicator: BoxDecoration(color: Colors.amberAccent),
            labelStyle: const TextStyle(color: Colors.amber),
            unselectedLabelColor: ColorConstants.grey,
            labelPadding: const EdgeInsets.symmetric(vertical: 10),
            tabs: [
              firstTab ?? Text("First Tab", style: tabTitleTextStyle),
              secondTab ??
                  Text(
                    "Second Tab",
                    style: tabTitleTextStyle,
                  ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            firstTabView ??
                const Center(
                  child: Text("Post"),
                ),
            secondTabView ??
                const Center(
                  child: Text("Momma's"),
                ),
          ],
        ),
      ),
    );
  }
}
