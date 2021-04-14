import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/core/constants/app/custom_text_style.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/screens/trips/model/driver_model.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/widgets/circle_image.dart';

class DriversInformation extends StatelessWidget {
  final Driver driver;

  const DriversInformation({Key key, this.driver}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(child: Container(), flex: 5,),
        Flexible(child: CircleImage(
          width: context.dynamicWidth(80 / 412),
          image: ImageConstants.DRIVER_IMAGE,
        ), flex: 30,),
        Flexible(child: Container(), flex: 5,),
        Flexible(
          flex: 70,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProjectText(text: driver.nameSurname, style: CustomTextStyle.black18w6,),
              ProjectText(text: driver.phoneNumber, style: CustomTextStyle.lightGrey18w5,)
            ],
          ),
        )
      ],
    );
  }
}
