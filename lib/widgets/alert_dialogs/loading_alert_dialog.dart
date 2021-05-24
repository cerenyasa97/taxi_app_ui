import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/extensions/maps/maps_extension.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/widgets/progress_indicator/custom_progress_indicator.dart';
import 'package:piton_taxi_app/core/constants/enums/trip_status.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/extensions/string/string_extension.dart';

class LoadingAlertDialog extends StatefulWidget {
  @override
  _LoadingAlertDialogState createState() => _LoadingAlertDialogState();
}

class _LoadingAlertDialogState extends State<LoadingAlertDialog> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5)).then((value) {
      Navigator.of(context).pop();
      _changeTripStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.dynamicWidth(ProjectConstants.ALERT_DIALOG_RADIUS))),
      content: Container(
        height: context.dynamicHeight(150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomProgressIndicator(),
            Text(LocaleKeys.searchingTaxiLabel.locale)
          ],
        ),
      ),
    );
  }

  _changeTripStatus() {
    context.mapProvider.changeTripStatus(TripStatus.TAXI_COMING);
    context.mapProvider.tripStarted();
  }
}
