import 'package:flutter/cupertino.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/core/constants/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/core/init/project_theme.dart';
import 'package:provider/provider.dart';


class UserInformations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.grey),
            image: DecorationImage(
                image: AssetImage(ImageConstants.DRIVER_IMAGE)
            )
        ),
      ),
        Column(
        children: [
          ProjectText(text: DummyData.driverName, style: Provider.of<ProjectThemeData>(context).getThemeData.textTheme.headline6,),
          ProjectText(text: DummyData.phone, style: Provider.of<ProjectThemeData>(context).getThemeData.textTheme.subtitle1,)
        ],
      ),
        IconButton(
        icon: Icon(Icons.close),
        onPressed: () => Navigator.of(context).pop(),
      ),
      ],
    );
  }
}
