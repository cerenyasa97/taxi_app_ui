import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';

class ProjectText extends StatelessWidget {
  final String text;
  final Color color;
  final double textSize;
  final FontWeight weight;
  final String family;
  final TextStyle style;
  final TextAlign align;

  const ProjectText(
      {Key key,
      @required this.text,
      this.textSize,
      this.color,
      this.weight,
      this.family,
      this.style,
      this.align})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          TextStyle(
            color: color ?? Colors.black,
            fontSize: context.textScale(16),
            fontWeight: weight ?? FontWeight.w400,
            fontFamily: family ?? "Roboto",
          ),
      textAlign: align ?? TextAlign.start,
    );
  }
}
