import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/init/theme/project_theme.dart';
import 'package:provider/provider.dart';
import '../buttons/next_page.dart';

class ErrorAlertDialog extends StatelessWidget {

  final String title;
  final String contentText;

  const ErrorAlertDialog({Key key, @required this.title, @required this.contentText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Provider.of<ProjectThemeData>(context).themeData.textTheme;
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(ProjectConstants.ALERT_DIALOG_RADIUS),
      ),
      title: ProjectTextLocale(
        text: title ?? "Warning",
        style: textTheme.headline3.copyWith(color: Colors.black87),
      ),
      content: ProjectTextLocale(
        text: contentText ?? " ",
        maxLines: 5,
        style: textTheme.bodyText1,
      ),
      actions: [NextPageButton(onTap: () => Navigator.of(context).pop())],
    );
  }
}