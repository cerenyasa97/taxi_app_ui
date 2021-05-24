import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:piton_taxi_app/core/extensions/theme/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';

class ProjectElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double width;
  final double height;
  final TextStyle style;
  final Color color;
  final Color borderColor;
  final Alignment align;
  final Widget child;
  final double radius;

  const ProjectElevatedButton(
      {Key key,
      @required this.onPressed,
      this.text,
      this.width,
      this.height,
      this.style,
      this.color,
      this.align,
      this.child,
      this.radius,
      this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.amber),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  side: BorderSide(
                    color: borderColor ?? color ?? Colors.amber,
                  ),
                  borderRadius: BorderRadius.circular(
                      ProjectConstants.BUTTON_BORDER_RADIUS))),
              shadowColor: MaterialStateProperty.all(Colors.blueAccent),
              overlayColor: MaterialStateColor.resolveWith(
                  (states) => Colors.transparent)),
          child: child ??
              Container(
                width: width ?? context.dynamicWidth(250),
                height: height ?? context.dynamicHeight(100),
                child: Align(
                    alignment: align ?? Alignment.center,
                    child: ProjectTextLocale(
                      text: text ?? LocaleKeys.general_enter,
                      style: style ?? context.textTheme.bodyText1,
                    )),
              ),
          onPressed: onPressed ?? () {}),
    );
  }
}