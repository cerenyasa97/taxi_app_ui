import 'package:piton_taxi_app/core/extensions/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/screens/trips/model/trip_model.dart';
import 'package:piton_taxi_app/screens/trips/view/trip_card.dart';
import 'package:piton_taxi_app/core/base/view/base_view.dart';
import 'package:flutter/material.dart';
import 'trip_detail_body.dart';
import 'driver_detail.dart';

class TripDetail extends BaseView{

  final Trip trip;

  TripDetail({@required this.trip});

  @override
  _TripDetailState createState() => _TripDetailState();
}

class _TripDetailState extends BaseState<TripDetail>{
  @override
  String appBarTitle() => TextConstants.TRIP_DETAILS;

  @override
  Widget body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TripCard(trip: widget.trip, margin: context.lowEdgeInsetsHorizontal,),
        TripDetailBody(trip: widget.trip),
        DriverDetail(driver: widget.trip.driver, rating: widget.trip.rating,),
      ],
    );
  }

  @override
  EdgeInsetsGeometry padding() => EdgeInsets.zero;
}
