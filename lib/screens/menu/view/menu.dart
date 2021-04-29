import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/extensions/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:flutter/material.dart';
import 'user_information.dart';
import 'menu_listview.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(context.dynamicWidth(40 / 412)),
            bottomRight: Radius.circular(context.dynamicWidth(40 / 412)),
          )),
          color: ProjectConstants.MENU_BACKGROUND_COLOR,
          child: Padding(
            padding: context.lowEdgeInsetsAll,
            child: Column(
              children: [UserInformations(), MenuListView()],
            ),
          ),
        ),
      ],
    );
  }
}
