import 'package:flutter/cupertino.dart';
import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:flutter/material.dart';

class WhiteContainerWithShadow extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius radius;
  final Color color;
  final Color shadowColor;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Widget child;

  const WhiteContainerWithShadow(
      {Key key,
      @required this.width,
      @required this.height,
      this.radius,
      this.color,
      this.shadowColor,
      this.padding,
      this.margin,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      padding: padding ?? EdgeInsets.zero,
      width: width ?? context.dynamicWidth(360),
      height: height ?? context.dynamicHeight(200),
      decoration: BoxDecoration(
        borderRadius: radius ??
            BorderRadius.circular(
                context.dynamicWidth(ProjectConstants.CONTAINER_BORDER_RADIUS)),
        color: color ?? Colors.white,
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? const Color(0x29000000),
            offset: Offset(0, 3),
            blurRadius: 10,
          ),
        ],
      ),
      child: child ??
          Container(
            color: Colors.white,
          ),
    );
  }
}
