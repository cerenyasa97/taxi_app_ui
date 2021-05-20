import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/core/components/image/project_svg_image.dart';
import 'package:piton_taxi_app/core/init/theme/project_theme.dart';
import 'package:piton_taxi_app/screens/trips/model/dummy_trip_model.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class TripCardBody extends StatelessWidget {

  final DummyTrip trip;

  const TripCardBody({Key key, @required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Provider.of<ProjectThemeData>(context).themeData.textTheme;
    return Row(
      children: [
        Expanded(child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ProjectTextLocale(
              text: trip.startTime,
              style: textTheme.subtitle1.copyWith(color: Colors.grey),
            ),
            ProjectTextLocale(
              text: trip.endTime,
              style: textTheme.subtitle1.copyWith(color: Colors.grey),
            ),
          ],
        ), flex: 15,),
        Expanded(flex: 15, child: SizedBox(height: context.dynamicHeight(80), child: ProjectSVGImage(imagePath: ImageConstants.ROUTE_ICON,),),),
        Expanded(flex: 65, child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProjectTextLocale(
              text: trip.startLocation,
              style: textTheme.bodyText1,
              maxLines: 2,
            ),
            ProjectTextLocale(
              text: trip.endLocation,
              style: textTheme.bodyText1,
              maxLines: 2,
            )
          ],
        ),)
      ],
    );
  }
}
