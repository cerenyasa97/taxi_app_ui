import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/screens/trips/model/dummy_trip_model.dart';
import 'package:piton_taxi_app/screens/trips/view/trip_card.dart';
import 'package:piton_taxi_app/core/base/view/base_view.dart';
import 'package:flutter/material.dart';
import 'trip_detail_body.dart';
import 'driver_detail.dart';

class TripDetail extends BaseView{

  final DummyTrip trip;

  TripDetail({@required this.trip});

  @override
  _TripDetailState createState() => _TripDetailState();
}

class _TripDetailState extends BaseState<TripDetail>{
  @override
  String appBarTitle() => LocaleKeys.trips_tripDetails_title;

  @override
  Widget body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TripCard(trip: widget.trip, margin: context.lowEdgeInsetsHorizontal, isEnabled: false),
        TripDetailBody(trip: widget.trip),
        DriverDetail(driver: widget.trip.driver, rating: widget.trip.rating,),
      ],
    );
  }

  @override
  EdgeInsetsGeometry padding() => EdgeInsets.zero;
}
