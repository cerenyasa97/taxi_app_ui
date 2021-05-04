import 'package:piton_taxi_app/screens/home/view/trip_description_panel/trip_description_header.dart';
import 'package:piton_taxi_app/core/constants/dummy_data/dummy_data.dart';
import 'package:piton_taxi_app/widgets/trip_sliding_up_panel.dart';
import 'package:piton_taxi_app/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class TripDurationDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: TripSlidingUpPanel(
        maxHeight: 0.45,
        panel: Column(
          children: [
            TripDescriptionHeader(),
            CustomListTile(
              title: DummyData.driver.nameSurname,
              subtitle: DummyData.driver.licensePlate,
            )
          ],
        ),
      ),
    );
  }
}
