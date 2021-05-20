import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/components/container/white_container_with_shadow.dart';
import 'package:piton_taxi_app/core/extensions/theme/theme_extension.dart';
import 'package:piton_taxi_app/core/components/image/project_svg_image.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/screens/home/utils/google_map_provider.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:provider/provider.dart';

class TripRoute extends StatelessWidget {
  const TripRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle routeStyle = context.textTheme.bodyText2
        .copyWith(color: Colors.black87, fontWeight: FontWeight.w500);
    return Center(
      child: WhiteContainerWithShadow(
        width: context.dynamicWidth(360),
        height: context.dynamicHeight(100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: ProjectSVGImage(
                imagePath: ImageConstants.ROUTE_ICON,
                height: context.dynamicHeight(70),
              ),
              flex: 2,
            ),
            Expanded(
              flex: 7,
              child: Container(
                height: context.dynamicHeight(90),
                child: Consumer<GoogleMapProvider>(
                  builder: (context, mapModel, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ProjectTextLocale(
                          text: mapModel.initialLocation != null
                              ? mapModel.initialLocation.name
                              : LocaleKeys.home_whereFromTo_from,
                          maxLines: 2,
                          style: routeStyle,
                        ),
                        ProjectTextLocale(
                          text: mapModel.destinationLocation != null
                              ? mapModel.destinationLocation.name
                              : LocaleKeys.home_whereFromTo_to,
                          maxLines: 2,
                          style: routeStyle,
                        ),
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
