import 'package:flutter/material.dart';
import 'package:piton_taxi_app/screens/home/view/google_map_background.dart';
import 'trip_during_detail.dart';

class TripDuring extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMapBackground(),
          TripDurationDetail()
        ],
      ),
    );
  }
}
