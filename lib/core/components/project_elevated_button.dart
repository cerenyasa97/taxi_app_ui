import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/core/init/project_theme.dart';
import 'package:provider/provider.dart';

class ProjectElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const ProjectElevatedButton({Key key, @required this.onPressed, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(0),
        ),
        child: Container(
          //width: double.maxFinite,
            child: ProjectText(
              text: text ?? "Enter a text",
              style: Provider.of<ProjectThemeData>(context)
                  .getThemeData
                  .textTheme
                  .bodyText2,
              align: TextAlign.start,
            )),
        onPressed: onPressed ?? () {});
  }
}
