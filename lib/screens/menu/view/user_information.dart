import 'package:piton_taxi_app/widgets/circle_image.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/core/constants/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/init/project_theme.dart';
import 'package:provider/provider.dart';


class UserInformations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleImage(),
        Column(
        children: [
          ProjectText(text: DummyData.user_1.nameSurname, style: Provider.of<ProjectThemeData>(context).getThemeData.textTheme.headline6,),
          ProjectText(text: DummyData.user_1.phoneNumber, style: Provider.of<ProjectThemeData>(context).getThemeData.textTheme.subtitle1,)
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
