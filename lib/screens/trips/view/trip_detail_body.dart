import 'package:piton_taxi_app/core/components/white_container_with_shadow.dart';
import 'package:piton_taxi_app/core/constants/app/custom_text_style.dart';
import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/screens/trips/model/trip_model.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:flutter/material.dart';

class TripDetailBody extends StatelessWidget {
  final Trip trip;

  const TripDetailBody({Key key, this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WhiteContainerWithShadow(
        width: context.dynamicWidth(360 / 412),
        height: context.dynamicHeight(10 / 87),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _getInformationWithLabel("Distance"),
          context.greyThinVerticalDivider,
          _getInformationWithLabel("Time"),
          context.greyThinVerticalDivider,
          _getInformationWithLabel("Price"),
        ],
      ),
    );
  }

  // Function that returns trip's distance, time and price information and value labels as a column
  _getInformationWithLabel(String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProjectText(text: _getVariable(label), style: CustomTextStyle.black18w6,),
        ProjectText(text: label, style: CustomTextStyle.lightBlack18w5)
      ],
    );
  }

  // Returns the trip's distance, time and price information as a String
  String _getVariable(String label) {
    switch(label){
      case "Distance":
        return "${trip.distance} km";
      case "Time":
        return "${trip.time} m";
      case "Price":
        return "${trip.price} TL";
    }
  }
}
