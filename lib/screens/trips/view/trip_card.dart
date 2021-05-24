import 'package:piton_taxi_app/core/components/container/white_container_with_shadow.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/extensions/context/divider_extension.dart';
import 'package:piton_taxi_app/core/init/navigation/navigation_service.dart';
import 'package:piton_taxi_app/screens/trips/model/dummy_trip_model.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:flutter/material.dart';
import 'trip_card_title.dart';
import 'trip_card_body.dart';

class TripCard extends StatelessWidget {
  final DummyTrip trip;
  final EdgeInsetsGeometry margin;
  final bool isEnabled;

  TripCard({Key key, this.trip, this.margin, this.isEnabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint(isEnabled.toString());
    return GestureDetector(
      onTap: () {
        if (isEnabled)
          NavigationService.instance.navigatorPushSlidePage(
              context, Pages.TRIP_DETAIL,
              variable: trip);
      },
      child: WhiteContainerWithShadow(
        width: context.dynamicWidth(360),
        height: context.dynamicHeight(180),
        margin: margin ?? context.largestEdgeInsetsSymmetric,
        padding: context.medium1EdgeInsetsSymmetric,
        child: Column(
          children: [
            Expanded(
              child: TripCardTitle(
                date: trip.date,
                status: trip.tripStatus,
              ),
              flex: 20,
            ),
            Expanded(
              child: context.greyMediumHorizontalDivider,
              flex: 15,
            ),
            Expanded(
              child: TripCardBody(
                trip: trip,
              ),
              flex: 80,
            )
          ],
        ),
      ),
    );
  }
}
