import 'package:piton_taxi_app/widgets/image/circle_image.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'file:///C:/Users/Ceren/Desktop/piton_taxi_app/lib/core/constants/dummy_data/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/init/theme/project_theme.dart';
import 'package:provider/provider.dart';

class UserInformations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleImage(),
      title: ProjectTextLocale(
        text: DummyData.user_1.nameSurname,
        style: Provider.of<ProjectThemeData>(context)
            .themeData
            .textTheme
            .headline4
            .copyWith(color: Colors.black87),
      ),
      subtitle: ProjectTextLocale(
        text: DummyData.user_1.phoneNumber,
        style: Provider.of<ProjectThemeData>(context)
            .themeData
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