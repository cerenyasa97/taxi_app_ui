import 'package:piton_taxi_app/core/extensions/string/string_extension.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/components/button/project_elevated_button.dart';
import 'package:piton_taxi_app/core/extensions/theme/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';

class AmberButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double width;

  const AmberButton(
      {Key key, @required this.onPressed, this.text, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ProjectElevatedButton(
          width: width ?? context.dynamicWidth(300),
          height: context.dynamicHeight(50),
          style: context.textTheme.headline4.copyWith(color: Colors.white),
          text: (text ?? LocaleKeys.button_labels_ok).locale,
          onPressed: onPressed),
    );
  }
}
