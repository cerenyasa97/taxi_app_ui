import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/components/project_elevated_button.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/components/circular_corner_container.dart';
import 'package:piton_taxi_app/screens/home/utils/google_map_provider.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/core/init/project_routes.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WhereFromTo extends StatefulWidget {
  @override
  _WhereFromToState createState() => _WhereFromToState();
}

class _WhereFromToState extends State<WhereFromTo> {
  @override
  Widget build(BuildContext context) {
    return CircularCornerContainer(
      child: Row(
        children: [
          Flexible(
            child: SvgPicture.asset(ImageConstants.ROUTE_ICON),
            flex: 8,
          ),
          Flexible(
            child: Container(),
            flex: 5,
          ),
          Flexible(
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Consumer<GoogleMapProvider>(
                builder: (context, mapModel, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildProjectElevatedButton(
                          mapModel.initialLocation != null
                              ? mapModel.initialLocation.name
                              : TextConstants.WHERE_FROM,
                          TextConstants.WHERE_FROM),
                      Container(
                        height: 1,
                        width: context.dynamicWidth(270 / 412),
                        color: Colors.grey.shade300,
                      ),
                      buildProjectElevatedButton(
                          mapModel.destinationLocation != null
                              ? mapModel.destinationLocation.name
                              : TextConstants.WHERE_TO,
                          TextConstants.WHERE_TO),
                    ],
                  );
                },
              ),
            ),
            flex: 95,
          )
        ],
      ),
    );
  }

  // Returns selected address from select location page
  ProjectElevatedButton buildProjectElevatedButton(String text, String title) {
    return ProjectElevatedButton(
      width: context.dynamicWidth(250 / 412),
      align: Alignment.centerLeft,
      text: text,
      color: Colors.transparent,
      onPressed: () {
        Navigator.of(context).push(ProjectRoute.generateSlidePageRouteBuilder(
            Pages.SEARCH_LOCATION,
            ProjectConstants.FAST_PAGE_TRANSITION_DURATION,
            variable: title));
      },
    );
  }
}
/*
showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return LocationSearchAlertDialog(
                              title: title ,
                              onChanged: (text) {
                                setState(() {
                                  text = text;
                                });
                              },
                              initialText: (text == TextConstants.WHERE_FROM || text == TextConstants.WHERE_TO) ? "" : text);
                        });
 */
