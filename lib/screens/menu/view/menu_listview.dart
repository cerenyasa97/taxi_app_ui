import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/screens/menu/model/menu_model.dart';
import 'package:piton_taxi_app/core/extensions/context/sized_box_extension.dart';
import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'menu_list_item.dart';

class MenuListView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.heighestEdgeInsetsSymmetric,
      height: context.dynamicHeight(600),
      width: context.dynamicWidth(160),
      alignment: Alignment.centerLeft,
      child: ListView.separated(
        separatorBuilder: (context, index) => context.lowSizedBoxHeight,
        itemBuilder: (context, index) =>
          MenuListItem(menuItem: MenuModel.menuList[index], height: index < 3 ?  55 : 75),
        itemCount: MenuModel.getMenuListLength(),
      ),
    );
  }
}
