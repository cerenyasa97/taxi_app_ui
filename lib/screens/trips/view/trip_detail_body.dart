import 'package:flutter/cupertino.dart';
import 'package:piton_taxi_app/core/components/container/white_container_with_shadow.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/extensions/context/divider_extension.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/screens/trips/model/dummy_trip_model.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/core/init/theme/project_theme.dart';
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

  @override
  Widget build(BuildContext context) {
    return WhiteContainerWithShadow(
      width: context.dynamicWidth(360),
      height: context.dynamicHeight(widget.height ?? 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _getInformationWithLabel(LocaleKeys.trips_tripDetails_distanceLabel),
          context.greyThinVerticalDivider,
          _getInformationWithLabel(LocaleKeys.trips_tripDetails_durationLabel),
          context.greyThinVerticalDivider,
          _getInformationWithLabel(LocaleKeys.trips_tripDetails_priceLabel),
        ],
      ),
    );
  }

  _getInformationWithLabel(String label) {
    final TextTheme textTheme = Provider.of<ProjectThemeData>(context, listen: false).themeData.textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProjectTextLocale(text: _getVariable(label), style: textTheme.subtitle2.copyWith(fontWeight: FontWeight.w600),),
        ProjectTextLocale(text: label, style: textTheme.subtitle2.copyWith(color: Colors.black54))
      ],
    );
  }

  String _getVariable(String label) {
    switch(label){
      case LocaleKeys.trips_tripDetails_distanceLabel:
        return "${widget.trip.distance} km";
      case LocaleKeys.trips_tripDetails_durationLabel:
        return "${widget.trip.time} m";
      case LocaleKeys.trips_tripDetails_priceLabel:
        return "${widget.trip.price} TL";
      default:
        return "Error";
    }
  }
}
