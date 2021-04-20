import 'package:piton_taxi_app/widgets/circle_image.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'file:///C:/Users/Ceren/Desktop/piton_taxi_app/lib/core/constants/dummy_data/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/init/project_theme.dart';
import 'package:provider/provider.dart';

class UserInformations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleImage(),
      title: ProjectText(
        text: DummyData.user_1.nameSurname,
        style: Provider.of<ProjectThemeData>(context)
            .getThemeData
            .textTheme
            .headline4
            .copyWith(color: Colors.black87),
      ),
      subtitle: ProjectText(
        text: DummyData.user_1.phoneNumber,
        style: Provider.of<ProjectThemeData>(context)
            .getThemeData
            .textTheme
            .bodyText1,
      ),
      trailing: IconButton(
        icon: Icon(Icons.close),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}