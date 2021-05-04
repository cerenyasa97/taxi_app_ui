import 'package:flutter/cupertino.dart';
import 'package:piton_taxi_app/core/components/white_container_with_shadow.dart';
import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/extensions/divider_extension.dart';
import 'package:piton_taxi_app/screens/home/model/direction_model.dart';
import 'package:piton_taxi_app/screens/home/utils/google_map_provider.dart';
import 'package:piton_taxi_app/screens/trips/model/dummy_trip_model.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/core/init/project_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TripDetailBody extends StatefulWidget {
  final DummyTrip trip;
  final double height;

  const TripDetailBody({Key key, this.trip, this.height}) : super(key: key);

  @override
  _TripDetailBodyState createState() => _TripDetailBodyState();
}

class _TripDetailBodyState extends State<TripDetailBody> {

  DirectionModel _directionModel;

  @override
  Widget build(BuildContext context) {
    return Consumer<GoogleMapProvider>(
      builder: (context, mapModel, child) {
        _directionModel = mapModel.directionModel;
        return WhiteContainerWithShadow(
          width: context.dynamicWidth(360 / 412),
          height: context.dynamicHeight(widget.height ?? (10 / 87)),
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
      },
    );
  }

  _getInformationWithLabel(String label) {
    final TextTheme textTheme = Provider.of<ProjectThemeData>(context, listen: false).getThemeData.textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProjectText(text: _getVariable(label), style: textTheme.subtitle2.copyWith(fontWeight: FontWeight.w600),),
        ProjectText(text: label, style: textTheme.subtitle2.copyWith(color: Colors.black54))
      ],
    );
  }

  String _getVariable(String label) {
    switch(label){
      case "Distance":
        return widget.trip != null ? "${widget.trip.distance} km" : _directionModel.distanceText;
      case "Time":
        return widget.trip!= null ? "${widget.trip.time} m" : _directionModel.durationText;
      case "Price":
        List<String> distance = _directionModel.distanceText.split(" ");
        List<String> value = distance[0].split(",");
        double price = 4 + 4.5 * double.parse(value[0] + "." + value[1]);
        return widget.trip != null ? "${widget.trip.price} TL" : price.toStringAsFixed(2) + " TL";
      default:
        return "Error";
    }
  }
}
