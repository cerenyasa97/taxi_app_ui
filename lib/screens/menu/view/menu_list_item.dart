import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:piton_taxi_app/core/init/project_routes.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/profile.dart';
import 'package:piton_taxi_app/screens/menu/model/menu_model.dart';

class MenuListItem extends StatelessWidget {
  final Menu menuItem;

  const MenuListItem({Key key, this.menuItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
          ProjectRoute.generateSlidePageRouteBuilder(
              menuItem.page, ProjectConstants.FAST_PAGE_TRANSITION_DURATION)),
      child: ListTile(
        leading: Image.asset(menuItem.image),
        title: Text(menuItem.title),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 20,
        ),
      )
    );
  }
}
