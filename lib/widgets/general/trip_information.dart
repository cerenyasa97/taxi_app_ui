import 'package:piton_taxi_app/core/components/image/project_image.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/extensions/theme/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/screens/home/utils/google_map_provider.dart';
import 'package:provider/provider.dart';

class TripInformation extends StatelessWidget {
  const TripInformation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GoogleMapProvider>(builder: (context, mapModel, child) {
      double price = 0;
      List<String> distance = mapModel.tripDirectionModel.distanceText.split(" ");
      List<String> value = distance[0].split(",");
      price = 4 + 4.5 * double.parse(value[0] + "." + value[1]);
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getEqualContainers(
              context,
              ImageConstants.ROUTE_ICON_2,
              mapModel.tripDirectionModel.distanceText,
            40
          ),
          _getEqualContainers(
              context,
              ImageConstants.TIME_ICON,
              mapModel.tripDirectionModel.durationText,
            30
          ),
          _getEqualContainers(
              context,
              ImageConstants.COIN_ICON,
              price.toStringAsFixed(2) + " TL",
              30
          )
        ],
      );
    });
  }

  _getEqualContainers(BuildContext context, String image, String text, double width) {
    final TextStyle textStyle = context.textTheme.bodyText2;
    return Container(
      width: context.dynamicWidth(120),
      height: context.dynamicHeight(40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProjectImage(imagePath: image, width: context.dynamicWidth(width),),
          ProjectTextLocale(text: text, style: textStyle,)
        ],
      ),
    );
  }
}
