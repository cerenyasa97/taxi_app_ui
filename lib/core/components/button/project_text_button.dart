import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/core/extensions/theme/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';

class ProjectTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle style;
  final Widget child;

  const ProjectTextButton(
      {Key key, this.child, this.text, @required this.onPressed, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          overlayColor:
              MaterialStateColor.resolveWith((states) => Colors.transparent)),
      child: child ??
          ProjectTextLocale(
            text: text ?? LocaleKeys.button_labels_ok,
            style: style ?? context.textTheme.headline4,
          ),
      onPressed: onPressed ?? () {},
    );
  }
}
