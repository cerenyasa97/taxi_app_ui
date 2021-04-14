import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/constants/dummy_data.dart';
import 'package:piton_taxi_app/screens/trips/view/trip_card.dart';

class CompletedPage extends StatefulWidget {
  @override
  _CompletedPageState createState() => _CompletedPageState();
}

class _CompletedPageState extends State<CompletedPage>
    with AutomaticKeepAliveClientMixin<CompletedPage>{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) =>
          TripCard(trip: DummyData.completed[index]),
      itemCount: DummyData.completed.length,
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
