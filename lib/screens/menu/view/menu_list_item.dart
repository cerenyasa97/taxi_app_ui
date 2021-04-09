import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:piton_taxi_app/core/init/project_routes.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/widgets/custom_list_tile.dart';
import 'package:piton_taxi_app/screens/menu/model/menu_model.dart';

class MenuListItem extends StatelessWidget {
  final Menu menuItem;

  const MenuListItem({Key key, this.menuItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      title: menuItem.title,
      imagePath: menuItem.image,
      onTap: () => Navigator.of(context).pushReplacement(
          ProjectRoute.generateSlidePageRouteBuilder(
              menuItem.page, ProjectConstants.FAST_PAGE_TRANSITION_DURATION)),
    );
  }
}
