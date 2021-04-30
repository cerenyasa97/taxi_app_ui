import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/init/project_theme.dart';
import 'package:provider/provider.dart';
import 'next_page.dart';

class ErrorAlertDialog extends StatelessWidget {

  final String title;
  final String contentText;

  const ErrorAlertDialog({Key key, @required this.title, @required this.contentText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Provider.of<ProjectThemeData>(context).getThemeData.textTheme;
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(context.dynamicWidth(20 / 412)),
      ),
      title: ProjectText(
        text: title ?? "Warning",
        style: textTheme.headline3.copyWith(color: Colors.black87),
      ),
      content: ProjectText(
        text: contentText ?? " ",
        maxLines: 5,
        style: textTheme.bodyText1,
      ),
      actions: [NextPageButton(onTap: () => Navigator.of(context).pop())],
    );
  }
}