import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/screens/menu/model/menu_model.dart';
import 'menu_list_item.dart';

class MenuListView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(42/87),
      child: ListView.builder(
        itemBuilder: (context, index) =>
          MenuListItem(menuItem: MenuModel.menuList[index],),
        itemCount: MenuModel.getMenuListLength(),
      ),
    );
  }
}
