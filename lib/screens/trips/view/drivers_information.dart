import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/screens/trips/model/driver_model.dart';
import 'package:piton_taxi_app/widgets/image/circle_image.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/widgets/list_tile/custom_list_tile.dart';

class DriversInformation extends StatelessWidget {
  final Driver driver;

  const DriversInformation({Key key, this.driver}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      leadingCircleImage: CircleImage(
        image: ImageConstants.DRIVER_IMAGE,
      ),
      title: driver.nameSurname,
      subtitle: driver.phoneNumber,
      trailingIcon: Icon(Icons.arrow_forward_ios, color: Colors.transparent,),
    );
  }
}
/*
Row(
      children: [
        Flexible(child: Container(), flex: 5,),
        Flexible(child: CircleImage(
          width: context.dynamicWidth(80),
          image: ImageConstants.DRIVER_IMAGE,
        ), flex: 30,),
        Flexible(child: Container(), flex: 5,),
        Flexible(
          flex: 70,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProjectTextLocale(text: driver.nameSurname, style: textTheme.subtitle2,),
              ProjectTextLocale(text: driver.phoneNumber, style: textTheme.bodyText2.copyWith(color: Colors.grey.shade700),)
            ],
          ),
        )
      ],
    );
 */
