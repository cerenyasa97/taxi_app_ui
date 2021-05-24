import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/extensions/string/string_extension.dart';

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
    final _curScaleFactor = MediaQuery.of(context).textScaleFactor;
    return AutoSizeText(
      text.locale.isEmpty ? text : text.locale,
      style: style ??
          TextStyle(
            color: color ?? Colors.black,
            fontSize: 16 * _curScaleFactor,
            fontWeight: weight ?? FontWeight.w400,
            fontFamily: family ?? "Roboto",
          ),
      textAlign: align ?? TextAlign.start,
      maxLines: maxLines ?? 5,
    );
  }
}
/*
*@override
  Widget build(BuildContext context) {
    final _curScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Tooltip(
      message: "${text.locale}",
      child: Text(
        text.locale,
        overflow: TextOverflow.ellipsis,
        maxLines: 8,
        style: this.textStyle ??
           TextStyle(
              fontSize: this.fontSize != null ? this.fontSize * _curScaleFactor : CustomSize.size18 * _curScaleFactor,
              fontWeight: FontWeight.w500,
              color: this.textColor ?? Colors.black
            ),
        textAlign: this.textAlign ?? TextAlign.center,
      ),
    );
  }
*
*
*
*
*
*  */
