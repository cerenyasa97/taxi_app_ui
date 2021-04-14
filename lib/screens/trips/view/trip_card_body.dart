import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/components/project_svg_image.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/core/constants/app/custom_text_style.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/screens/trips/model/trip_model.dart';

class TripCardBody extends StatelessWidget {

  final Trip trip;

  const TripCardBody({Key key, @required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ProjectText(
              text: trip.startTime,
              style: CustomTextStyle.grey20w6,
            ),
            ProjectText(
              text: trip.endTime,
              style: CustomTextStyle.grey20w6,
            ),
          ],
        ), flex: 15,),
        Expanded(flex: 15, child: SizedBox(height: context.dynamicHeight(8/87), child: ProjectSVGImage(imagePath: ImageConstants.ROUTE_ICON,),),),
        Expanded(flex: 65, child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProjectText(
              text: trip.startLocation,
              style: CustomTextStyle.black16w6,
              maxLines: 2,
            ),
            ProjectText(
              text: trip.endLocation,
              style: CustomTextStyle.black16w6,
              maxLines: 2,
            )
          ],
        ),)
      ],
    );
  }
}
