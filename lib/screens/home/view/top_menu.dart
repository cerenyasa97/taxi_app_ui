import 'package:piton_taxi_app/core/components/project_circular_button.dart';
import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:piton_taxi_app/core/init/project_routes.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/screens/home/utils/google_map_provider.dart';
import 'package:provider/provider.dart';

class TopMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GoogleMapProvider>(
      builder: (context, mapModel, child) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProjectCircularButton(
              color: Colors.white,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return ProjectRoute.generatePageRoute(Pages.MENU);
                    });
              },
              child: Icon(Icons.menu)),
          Visibility(child: ProjectCircularButton(
            onPressed: () {
              mapModel.clearAll();
            },
            child: Icon(Icons.close),
            color: Colors.white,
          ), visible: mapModel.polylineSet.isNotEmpty,),
          ProjectCircularButton(
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).push(
                    ProjectRoute.generateSlidePageRouteBuilder(
                        Pages.NOTIFICATIONS,
                        ProjectConstants.FAST_PAGE_TRANSITION_DURATION));
              },
              child: Icon(Icons.notification_important_outlined))
        ],
      ),
    );
  }
}