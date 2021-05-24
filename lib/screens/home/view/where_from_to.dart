import 'package:piton_taxi_app/core/components/button/project_text_button.dart';
import 'package:piton_taxi_app/core/components/container/white_container_with_shadow.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/extensions/theme/theme_extension.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/core/init/navigation/navigation_service.dart';
import 'package:piton_taxi_app/screens/home/utils/google_map_provider.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/core/extensions/context/divider_extension.dart';
import 'package:piton_taxi_app/core/components/image/project_svg_image.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class WhereFromTo extends StatefulWidget {
  @override
  _WhereFromToState createState() => _WhereFromToState();
}

class _WhereFromToState extends State<WhereFromTo> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: context.dynamicHeight(130),
        left: context.dynamicWidth(40),
        right: context.dynamicWidth(40),
        child: WhiteContainerWithShadow(
          height: context.dynamicHeight(110),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProjectSVGImage(
                imagePath: ImageConstants.ROUTE_ICON,
                height: context.dynamicHeight(70),
              ),
              FittedBox(
                fit: BoxFit.fitHeight,
                child: Consumer<GoogleMapProvider>(
                  builder: (context, mapProvider, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildProjectElevatedButton(
                            mapProvider.initialLocation != null
                                ? mapProvider.initialLocation.name
                                : LocaleKeys.home_whereFromTo_from,
                            LocaleKeys.home_whereFromTo_from),
                        context.greyThinHorizontalDivider,
                        buildProjectElevatedButton(
                            mapProvider.destinationLocation != null
                                ? mapProvider.destinationLocation.name
                                : LocaleKeys.home_whereFromTo_to,
                            LocaleKeys.home_whereFromTo_to),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }

  // Returns selected address from select location page
  Widget buildProjectElevatedButton(String text, String title) {
    return Container(
      width: context.dynamicWidth(250),
      child: ProjectTextButton(
        child: Row(
          children: [ProjectTextLocale(text: text)],
        ),
        style: context.textTheme.bodyText1,
        onPressed: () {
          NavigationService.instance.navigatorPushSlidePage(
              context,
              Pages.SEARCH_LOCATION,
              variable: title);
          },
      ),
    );
  }
}
