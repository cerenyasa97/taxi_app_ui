import 'package:piton_taxi_app/core/components/project_circular_button.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'where_from_to.dart';
import 'top_menu.dart';

class HomePageBody extends StatelessWidget {
  final VoidCallback onPressed;

  const HomePageBody({Key key, @required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            vertical: ScreenUtil().setHeight(40),
            horizontal: ScreenUtil().setWidth(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: TopMenu(),
              flex: 10,
            ),
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Flexible(
              child: WhereFromTo(),
              flex: 13,
            ),
            Flexible(
              child: Container(),
              flex: 54,
            ),
            Flexible(
              child: ProjectCircularButton(
                color: Colors.white,
                child: Image.asset(
                  ImageConstants.SATELLITE_ICON,
                ),
                onPressed: onPressed,
              ),
              flex: 6,
            )
          ],
        ));
  }
}
