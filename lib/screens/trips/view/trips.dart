import 'package:piton_taxi_app/core/extensions/string/string_extension.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/screens/trips/view/cancelled_page.dart';
import 'package:piton_taxi_app/screens/trips/view/oncoming_page.dart';
import 'package:piton_taxi_app/core/base/view/base_view.dart';
import 'package:piton_taxi_app/core/init/navigation/pages_import.dart';
import 'package:flutter/material.dart';
import 'completed_page.dart';

class Trips extends BaseView {
  @override
  _TripsState createState() => _TripsState();
}

class _TripsState extends BaseState<Trips> {
  @override
  String appBarTitle() => LocaleKeys.trips_title;

  @override
  Widget body() {
    return DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(tabs: [
              Tab(
                text: LocaleKeys.trips_tabs_tab1Title.locale,
              ),
              Tab(
                text: LocaleKeys.trips_tabs_tab2Title.locale,
              ),
              Tab(
                text: LocaleKeys.trips_tabs_tab3Title.locale,
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
