import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/components/container/white_container_with_shadow.dart';
import 'package:piton_taxi_app/screens/trips/model/driver_model.dart';
import 'package:flutter/material.dart';
import 'drivers_information.dart';
import 'driver_comment.dart';

class DriverDetail extends StatelessWidget {
  final Driver driver;
  final int rating;

  const DriverDetail({Key key, this.driver, this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WhiteContainerWithShadow(
        width: context.dynamicWidth(360),
        height: context.dynamicHeight(360),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DriversInformation(driver: driver),
            DriverComment(rating: rating)
          ],
        ),
    );
  }
}
