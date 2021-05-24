import 'package:piton_taxi_app/core/components/container/white_container_with_shadow.dart';
import 'package:piton_taxi_app/screens/notifications/model/notification_model.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/constants/dummy_data/dummy_data.dart';
import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:piton_taxi_app/core/init/navigation/project_routes.dart';
import 'package:piton_taxi_app/widgets/list_tile/custom_list_tile.dart';
import 'package:flutter/material.dart';

class NotificationList extends StatefulWidget {
  @override
  _NotificationListState createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  List<NotificationModel> _notificationList;

  @override
  void initState() {
    super.initState();
    _notificationList = DummyData.notificationList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.lowEdgeInsetsVertical,
      height: context.dynamicHeight(435),
      child: ListView.builder(
        itemBuilder: (context, index) => WhiteContainerWithShadow(
          margin: context.lowEdgeInsetsVertical,
          width: context.width,
          height: context.dynamicHeight(70),
          child: CustomListTile(
            title: _notificationList[index].notificationTitle,
            leadingIcon: Icon(
              _notificationList[index].typeIcon,
              size: 30,
              color: Colors.amber,
            ),
            onTap: () =>
                _navigateOnTap(_notificationList[index].notificationType),
          ),
        ),
        itemCount: _notificationList.length,
      ),
    );
  }

  _navigateOnTap(NotificationType type) {
    if (type == NotificationType.oncoming ||
        type == NotificationType.completed ||
        type == NotificationType.cancelled) {
      ProjectRoute.generateSlidePageRouteBuilder(
          Pages.TRIP_DETAIL, ProjectConstants.FAST_PAGE_TRANSITION_DURATION);
    } else {
      ProjectRoute.generateSlidePageRouteBuilder(
          Pages.HOME, ProjectConstants.FAST_PAGE_TRANSITION_DURATION);
    }
  }
}
