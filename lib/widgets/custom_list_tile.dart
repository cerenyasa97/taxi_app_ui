import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/core/constants/app/custom_text_style.dart';
import 'package:piton_taxi_app/core/init/project_theme.dart';
import 'package:provider/provider.dart';

class CustomListTile extends StatelessWidget {

  final String imagePath;
  final String title;
  final String subtitle;
  final Function() onTap;

  const CustomListTile({Key key, this.imagePath, @required this.title, this.subtitle, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Icon(Icons.arrow_forward_ios, size: 20,),
      leading: imagePath != null ? Image.asset(imagePath) : null,
      title: ProjectText(text: title ?? "", style: Provider.of<ProjectThemeData>(context).getThemeData.textTheme.subtitle1,),
      subtitle: subtitle != null ? ProjectText(text: subtitle, style: CustomTextStyle.profileGeneralLabelStyle,) : null,
      onTap: onTap,
    );
  }
}
