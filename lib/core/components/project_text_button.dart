import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/init/project_theme.dart';
import 'package:provider/provider.dart';

class ProjectTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle style;

  const ProjectTextButton(
      {Key key, @required this.text, @required this.onPressed, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        text ?? "Text Button",
        style: style ??
            Provider.of<ProjectThemeData>(context)
                .getThemeData
                .textTheme
                .headline4,
      ),
      onPressed: onPressed ?? () {},
    );
  }
}
