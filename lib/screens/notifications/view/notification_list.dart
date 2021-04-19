import 'package:piton_taxi_app/screens/notifications/model/notification_model.dart';
import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/constants/dummy_data/dummy_data.dart';
import 'package:piton_taxi_app/widgets/custom_list_tile.dart';
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
      height: context.dynamicHeight(1/2),
      child: ListView.builder(
        itemBuilder: (context, index) => Container(
          margin: context.lowEdgeInsetsVertical,
          height: context.dynamicHeight(65 / 870),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color(0x29000000),
                offset: Offset(0, 3),
                blurRadius: 6,
              ),
            ],
          ),
          child: CustomListTile(
            title: _notificationList[index].notificationTitle,
            leadingIcon: Icon(_notificationList[index].typeIcon, size: 30, color: Colors.amber,),
          ),
        ),
        itemCount: _notificationList.length,
      ),
    );
  }
}

