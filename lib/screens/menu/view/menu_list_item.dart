import 'package:piton_taxi_app/core/components/image/project_image.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:piton_taxi_app/core/init/navigation/navigation_service.dart';
import 'package:piton_taxi_app/screens/menu/model/menu_model.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/extensions/context/sized_box_extension.dart';
import 'package:flutter/material.dart';

class MenuListItem extends StatelessWidget {
  final MenuModel menuItem;
  final double height;

  const MenuListItem({Key key, this.menuItem, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => NavigationService.instance
          .navigatorPushSlidePage(context, menuItem.page),
      child: Container(
        height: context.dynamicWidth(height),
        width: context.dynamicWidth(160),
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(ProjectConstants.MENU_ITEM_BORDER_RADIUS),
          border: Border.all(width: 2.0, color: Colors.white),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: ProjectImage(
                imagePath: menuItem.image,
                width: context.dynamicWidth(32),
              ),
              flex: 5,
            ),
            Flexible(child: context.lowSizedBoxWidth),
            Expanded(
              child: ProjectTextLocale(
                text: menuItem.title,
                maxLines: 2,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              flex: 10,
            )
          ],
        ),
      ),
    );
  }
}
