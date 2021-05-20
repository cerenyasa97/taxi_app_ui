import 'package:flutter/cupertino.dart';
import 'package:piton_taxi_app/core/constants/enums/trip_status.dart';
import 'package:piton_taxi_app/screens/home/utils/google_map_provider.dart';
import 'package:piton_taxi_app/screens/home/view/trip_description_panel/taxi_coming_detail.dart';
import 'package:piton_taxi_app/widgets/sliding_up_panel/trip_sliding_up_panel.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/init/navigation/pages_import.dart';
import 'package:provider/provider.dart';
import 'before_trip_detail.dart';
import 'during_trip_detail.dart';
import 'trip_end_detail.dart';

class TripDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: TripSlidingUpPanel(panel:
          Consumer<GoogleMapProvider>(builder: (context, mapModel, child) {
            switch (mapModel.tripStatus) {
              case TripStatus.AFTER_DRAWING_TRIP_ROUTE:
                return BeforeTripDetail();
              case TripStatus.TAXI_COMING:
                return TaxiComingDetail();
              case TripStatus.TRIP_STARTED:
                return DuringTripDetail();
              case TripStatus.TRIP_END:
                return TripEndDetail();
              default:
                return Container();
            }
      })),
    );
  }
}