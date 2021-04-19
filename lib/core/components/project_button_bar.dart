import 'package:piton_taxi_app/core/init/project_theme.dart';
import '../constants/text/text_constants.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'project_text_button.dart';

class ProjectButtonBar extends StatelessWidget {

  final VoidCallback onPressed;
  final VoidCallback cancelOnPressed;
  final String leftButtonText;
  final String rightButtonText;

  const ProjectButtonBar({Key key, @required this.onPressed, this.leftButtonText, this.rightButtonText, this.cancelOnPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: [
        ProjectTextButton(
            onPressed: () => cancelOnPressed ?? Navigator.of(context).pop(),
            text: leftButtonText ?? TextConstants.CANCEL_BUTTON),
        ProjectTextButton(
          onPressed: () => onPressed(),
          text: rightButtonText ??  TextConstants.SAVE_BUTTON,
          style: Provider.of<ProjectThemeData>(context).getThemeData.textTheme.headline4.copyWith(color: Colors.amber),
        ),
      ],
    );
  }
}
