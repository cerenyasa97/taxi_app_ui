import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/core/constants/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/init/project_theme.dart';
import 'package:provider/provider.dart';


class UserInformations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProjectText(text: DummyData.driverName, style: Provider.of<ProjectThemeData>(context).getThemeData.textTheme.subtitle2,),
        ProjectText(text: DummyData.phone, style: Provider.of<ProjectThemeData>(context).getThemeData.textTheme.bodyText1,)
      ],
    );
  }
}
