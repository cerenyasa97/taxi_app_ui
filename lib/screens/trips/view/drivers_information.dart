import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/core/init/project_theme.dart';
import 'package:piton_taxi_app/screens/trips/model/driver_model.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/widgets/circle_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DriversInformation extends StatelessWidget {
  final Driver driver;

  const DriversInformation({Key key, this.driver}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Provider.of<ProjectThemeData>(context).getThemeData.textTheme;
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
              ProjectText(text: driver.nameSurname, style: textTheme.subtitle2,),
              ProjectText(text: driver.phoneNumber, style: textTheme.subtitle2.copyWith(color: Colors.grey.shade700),)
            ],
          ),
        )
      ],
    );
  }
}
