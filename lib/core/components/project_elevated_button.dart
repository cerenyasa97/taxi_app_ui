import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/core/init/project_theme.dart';
import 'package:provider/provider.dart';

class ProjectElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double width;
  final double height;
  final TextStyle style;
  final Color color;
  final Alignment align;

  const ProjectElevatedButton(
      {Key key,
      @required this.onPressed,
      @required this.text,
      this.width,
      this.height,
      this.style,
      this.color, this.align})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ProjectThemeData>(context).getThemeData;
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(0),
        ),
        child: Container(
          color: color ?? themeData.buttonTheme.colorScheme.primary,
          width: width,
          height: height,
          child: Align(
            alignment: align ?? Alignment.center,
            child: ProjectText(
              text: text ?? "Enter a text",
              style: style ?? themeData.textTheme.bodyText1,
            )
          ),
        ),
        onPressed: onPressed ?? () {});
  }
}

/*
ElevatedButton(
              child: Container(
                width: context.dynamicWidth(300 / 412),
                height: context.dynamicHeight(5/87),
                child: Center(
                  child: ProjectText(
                    style: Provider.of<ProjectThemeData>(context).getThemeData.textTheme.headline3.copyWith(color: Colors.white),
                    text: TextConstants.OK_BUTTON,
                  ),
                ),
              ),
              onPressed: () => debugPrint("pressed"),
            ),
 */
