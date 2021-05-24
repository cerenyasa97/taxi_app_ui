import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/core/init/theme/project_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final Function() onTap;
  final bool titleBold;
  final Icon leadingIcon;
  final Widget leadingCircleImage;
  final Widget trailingIcon;
  final TextStyle titleStyle;
  final TextStyle subtitleStyle;

  const CustomListTile({Key key,
    this.imagePath,
    @required this.title,
    this.subtitle,
    this.onTap,
    this.titleBold = true,
    this.leadingIcon,
    this.trailingIcon,
    this.titleStyle, this.leadingCircleImage, this.subtitleStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme =
        Provider
            .of<ProjectThemeData>(context)
            .themeData
            .textTheme;
    return ListTile(
      trailing: trailingIcon ?? Icon(
        Icons.arrow_forward_ios,
        size: 20,
      ),
      leading: (imagePath == null && leadingIcon == null)
          ? leadingCircleImage
          : (imagePath != null
          ? Image.asset(
        imagePath,
        fit: BoxFit.fitHeight,
      )
          : (leadingIcon ?? null)),
      title: ProjectTextLocale(
        text: title ?? "",
        style: titleStyle ?? textTheme.bodyText1.copyWith(
            fontWeight: titleBold ? FontWeight.w600 : FontWeight.normal),
      ),
      subtitle: subtitle != null
          ? ProjectTextLocale(
        text: subtitle,
        style: subtitleStyle ?? textTheme.bodyText2,
      )
          : null,
      onTap: onTap,
    );
  }
}
