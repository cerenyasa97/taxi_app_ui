import 'package:piton_taxi_app/core/extensions/string/string_extension.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ProjectTextLocale extends StatelessWidget {
  final String text;
  final Color color;
  final double textSize;
  final FontWeight weight;
  final String family;
  final TextStyle style;
  final TextAlign align;
  final int maxLines;

  const ProjectTextLocale(
      {Key key,
      @required this.text,
      this.textSize,
      this.color,
      this.weight,
      this.family,
      this.style,
      this.align,
      this.maxLines,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _factor = MediaQuery.of(context).textScaleFactor;
    return AutoSizeText(
      text.locale != null ? text.locale : text,
      style: style ?? TextStyle(
        color: color ?? Colors.black,
        fontSize: 16 * _factor,
        fontWeight: weight ?? FontWeight.w400,
        fontFamily: family ?? "Roboto"
      ),
      textAlign: align ?? TextAlign.start,
      maxLines: maxLines ?? 5,
    );
  }
}