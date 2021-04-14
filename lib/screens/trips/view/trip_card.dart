import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/components/white_container_with_shadow.dart';
import 'package:piton_taxi_app/core/init/project_routes.dart';
import 'package:piton_taxi_app/screens/trips/model/trip_model.dart';
import 'package:flutter/material.dart';
import 'trip_card_title.dart';
import 'trip_card_body.dart';

class TripCard extends StatelessWidget {
  final Trip trip;
  final EdgeInsetsGeometry margin;

  const TripCard({Key key, this.trip, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(ProjectRoute.generateSlidePageRouteBuilder(Pages.TRIP_DETAIL, ProjectConstants.FAST_PAGE_TRANSITION_DURATION, variable: trip)),
      child: WhiteContainerWithShadow(
        width: context.dynamicWidth(360/412),
        height: context.dynamicHeight(18/87),
        margin: margin ?? context.largeEdgeInsetsSymmetric,
        padding: context.medium1EdgeInsetsSymmetric,
        child: Column(
          children: [
            Expanded(
              child: TripCardTitle(date: trip.date, status: trip.tripStatus,),
              flex: 20,
            ),
            Expanded(
              child: context.greyThinHorizontalDivider,
              flex: 15,
            ),
            Expanded(
              child: TripCardBody(trip: trip,),
              flex: 80,
            )
          ],
        ),
      ),
    );
  }
}
