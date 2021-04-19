import 'package:piton_taxi_app/core/components/project_circular_button.dart';
import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:piton_taxi_app/core/init/project_routes.dart';
import 'package:flutter/material.dart';

class TopMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
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
        ProjectCircularButton(
          color: Colors.white,
            onPressed: () {
              Navigator.of(context).push(ProjectRoute.generateSlidePageRouteBuilder(Pages.NOTIFICATIONS, ProjectConstants.FAST_PAGE_TRANSITION_DURATION));
            },
            child: Icon(Icons.notification_important_outlined))
      ],
    );
  }
}
