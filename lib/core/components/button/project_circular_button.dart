import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';

class ProjectCircularButton extends StatelessWidget {
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
  final Widget child;
  final Color color;

  const ProjectCircularButton(
      {Key key, @required this.onPressed, @required this.child, this.color, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () {},
      child: Padding(
        padding: padding ?? context.lowest2EdgeInsetsAll,
        child: child ?? ProjectTextLocale(text: LocaleKeys.button_labels_ok),
      ),
      style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          primary: color ?? Colors.amber),
    );
  }
}
