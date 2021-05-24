import 'package:piton_taxi_app/screens/home/view/trip_description_panel/trip_description.dart';
import 'package:piton_taxi_app/screens/home/view/trip_description_panel/trip_payment.dart';
import 'package:piton_taxi_app/screens/home/view/google_map_background.dart';
import 'package:piton_taxi_app/screens/home/utils/google_map_provider.dart';
import 'package:piton_taxi_app/core/constants/enums/trip_status.dart';
import 'package:piton_taxi_app/screens/home/view/where_from_to.dart';
import 'package:piton_taxi_app/core/constants/enums/payments.dart';
import 'package:piton_taxi_app/screens/home/view/top_menu.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final Widget menuButton;

  const HomePage({Key key, this.menuButton}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Consumer<GoogleMapProvider>(
        builder: (context, mapModel, child) {
          return Stack(
          children: [
            GoogleMapBackground(),
            TopMenu(menuButton: widget.menuButton),
            Visibility(
              child: WhereFromTo(),
              visible: mapModel.tripStatus == TripStatus.BEFORE_TRIP,
            ),
            Visibility(
              child: TripDescription(),
              visible: mapModel.polylineSet.isNotEmpty &&
                  mapModel.tripStatus != TripStatus.TRIP_PAYMENT,
            ),
            Visibility(
              child: TripPayment(),
              visible: mapModel.tripStatus == TripStatus.TRIP_PAYMENT &&
                  mapModel.paymentStatus != Payments.DONE,
            ),
          ],
        );}
      ),
    );
  }
}