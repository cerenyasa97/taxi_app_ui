import 'package:piton_taxi_app/core/constants/enums/trip_status.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/components/button/project_circular_button.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:piton_taxi_app/core/init/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/screens/home/utils/google_map_provider.dart';
import 'package:provider/provider.dart';

class TopMenu extends StatelessWidget {
  final Widget menuButton;

  const TopMenu({Key key, this.menuButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: context.dynamicWidth(20),
        right: context.dynamicWidth(20),
        top: context.dynamicHeight(60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            menuButton,
            Consumer<GoogleMapProvider>(
              builder: (context, mapModel, child) => Visibility(
                child: ProjectCircularButton(
                  onPressed: () {
                    mapModel.clearAll();
                  },
                  child: Icon(Icons.close),
                  color: Colors.white,
                ),
                visible:
                    mapModel.tripStatus == TripStatus.AFTER_DRAWING_TRIP_ROUTE,
              ),
            ),
            ProjectCircularButton(
                color: Colors.white,
                onPressed: () {
                  NavigationService.instance.navigatorPushSlidePage(
                    context,
                    Pages.NOTIFICATIONS,
                  );
                },
                child: Icon(Icons.notification_important_outlined))
          ],
        ));
  }
}
