import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/core/extensions/theme/theme_extension.dart';
import 'package:flutter/material.dart';
import '../button/project_text_button.dart';

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
            text: leftButtonText ?? LocaleKeys.button_labels_cancel),
        ProjectTextButton(
          onPressed: onPressed ?? (){},
          text: rightButtonText ??  LocaleKeys.button_labels_save,
          style: context.textTheme.headline4.copyWith(color: Colors.amber),
        ),
      ],
    );
  }
}
