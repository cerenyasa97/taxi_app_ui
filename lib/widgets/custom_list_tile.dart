import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/core/init/project_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {

  final String imagePath;
  final String title;
  final String subtitle;
  final Function() onTap;
  final bool titleBold;
  final Icon leadingIcon;

  const CustomListTile({Key key, this.imagePath, @required this.title, this.subtitle, this.onTap, this.titleBold = true, this.leadingIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Provider.of<ProjectThemeData>(context).getThemeData.textTheme;
    return ListTile(
      trailing: Icon(Icons.arrow_forward_ios, size: 20,),
      leading: imagePath != null ? Image.asset(imagePath, fit: BoxFit.fitHeight,) : (leadingIcon ?? null),
      title: ProjectText(text: title ?? "", style: textTheme.bodyText1.copyWith(fontWeight: titleBold ? FontWeight.bold : FontWeight.normal),),
      subtitle: subtitle != null ? ProjectText(text: subtitle, style: textTheme.bodyText1,) : null,
      onTap: onTap,
    );
  }
}
