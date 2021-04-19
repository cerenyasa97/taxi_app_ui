import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/screens/trips/view/cancelled_page.dart';
import 'package:piton_taxi_app/screens/trips/view/oncoming_page.dart';
import 'package:piton_taxi_app/core/base/view/base_view.dart';
import 'package:piton_taxi_app/core/init/pages_import.dart';
import 'package:flutter/material.dart';
import 'completed_page.dart';

class Trips extends BaseView {
  @override
  _TripsState createState() => _TripsState();
}

class _TripsState extends BaseState<Trips> {
  @override
  String appBarTitle() => TextConstants.TRIPS_TITLE;

  @override
  Widget body() {
    return DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(tabs: [
              Tab(
                text: TextConstants.TRIPS_TAB_BAR_TITLE_1,
              ),
              Tab(
                text: TextConstants.TRIPS_TAB_BAR_TITLE_2,
              ),
              Tab(
                text: TextConstants.TRIPS_TAB_BAR_TITLE_3,
              )
            ]),
            Expanded(
              child: TabBarView(
                  children: [OncomingPage(), CompletedPage(), CancelledPage()]),
            ),
          ],
        ));
  }

  @override
  EdgeInsetsGeometry padding() => EdgeInsets.zero;
}
