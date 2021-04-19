import 'package:piton_taxi_app/core/components/white_container_with_shadow.dart';
import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/init/project_theme.dart';
import 'package:piton_taxi_app/screens/trips/model/trip_model.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          _getInformationWithLabel("Distance", context),
          context.greyThinVerticalDivider,
          _getInformationWithLabel("Time", context),
          context.greyThinVerticalDivider,
          _getInformationWithLabel("Price", context),
        ],
      ),
    );
  }

  // Function that returns trip's distance, time and price information and value labels as a column
  _getInformationWithLabel(String label, BuildContext context) {
    final TextTheme textTheme = Provider.of<ProjectThemeData>(context).getThemeData.textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProjectText(text: _getVariable(label), style: textTheme.subtitle2,),
        ProjectText(text: label, style: textTheme.subtitle2.copyWith(color: Colors.black87))
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
      default:
        return "Error";
    }
  }
}
