import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/components/project_elevated_button.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class AmberButton extends StatelessWidget {

  final VoidCallback onPressed;
  final String text;

  const AmberButton({Key key, this.onPressed, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ProjectElevatedButton(
        width: context.dynamicWidth(300 / 412),
        height: context.dynamicHeight(5 / 87),
        style: context.textTheme.headline3.copyWith(color: Colors.white),
        text: text ?? TextConstants.OK_BUTTON,
        onPressed: onPressed
      ),
    );
  }
}
