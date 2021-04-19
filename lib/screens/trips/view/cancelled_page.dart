import 'package:piton_taxi_app/core/constants/dummy_data/dummy_data.dart';
import 'package:piton_taxi_app/screens/trips/view/trip_card.dart';
import 'package:flutter/material.dart';

class CancelledPage extends StatefulWidget {
  @override
  _CancelledPageState createState() => _CancelledPageState();
}

class _CancelledPageState extends State<CancelledPage>
    with AutomaticKeepAliveClientMixin<CancelledPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) =>
          TripCard(trip: DummyData.cancelled[index]),
      itemCount: DummyData.cancelled.length,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
