import 'package:flutter/material.dart';

import '../constants/app/custom_text_style.dart';
import '../constants/text/text_constants.dart';
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
          style: CustomTextStyle.yellowTextStyle,
        ),
      ],
    );
  }
}
