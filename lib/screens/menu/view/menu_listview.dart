import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:flutter/material.dart';
import '../model/menu_list.dart';
import 'menu_list_item.dart';

class MenuListView extends StatelessWidget {
  final MenuList menuList = MenuList();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(71/174),
      child: ListView.builder(
        itemBuilder: (context, index) =>
          MenuListItem(menuItem: menuList.menu[index],),
        itemCount: 6,
      ),
    );
  }
}
