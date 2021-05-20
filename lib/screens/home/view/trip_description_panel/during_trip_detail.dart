import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/constants/dummy_data/dummy_data.dart';
import 'package:piton_taxi_app/core/extensions/context/sized_box_extension.dart';
import 'package:piton_taxi_app/core/extensions/theme/theme_extension.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/widgets/general/trip_information.dart';
import 'package:piton_taxi_app/widgets/image/circle_image.dart';
import '../../../../widgets/general/trip_route.dart';
import 'package:flutter/material.dart';

class DuringTripDetail extends StatelessWidget {
  const DuringTripDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme theme = context.textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
            padding: context.lowEdgeInsetsHorizontal,
            child: Row(
              children: [
                CircleImage(
                  image: DummyData.driver.imagePath,
                  width: context.dynamicWidth(70),
                ),
                context.lowSizedBoxWidth,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ProjectTextLocale(
                        text: DummyData.driver.nameSurname,
                        style: theme.headline5.copyWith(color: Colors.black87),
                      ),
                      context.lowest0SizedBoxHeight,
                      ProjectTextLocale(
                        text: DummyData.driver.licensePlate,
                        style:
                        theme.bodyText2.copyWith(color: Colors.grey.shade600),
                      )
                    ],
                  ),
                  flex: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.star_half_outlined,
                      color: Colors.amber,
                      size: 30,
                    ),
                    ProjectTextLocale(text: DummyData.driver.rating),
                  ],
                )
              ],
            ),
        ),
        TripInformation(),
        TripRoute()
      ],
    );
  }
}
/*
Expanded(
          child: ProjectText(
            text: TextConstants.TRIP_ROUTE,
            style: descriptionStyle,
          ),
          flex: 1,
        ),
        Expanded(
          flex: 5,
          child: TripRoute(),
        ),
        Expanded(
          child: ProjectText(
            text: TextConstants.TRIP_STARTED,
            style: descriptionStyle,
          ),
          flex: 1,
        )
 */
