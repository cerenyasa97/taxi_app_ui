import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:flutter/material.dart';

class CircularCornerContainer extends StatelessWidget {

  final Widget child;
  final double height;
  final double width;
  final double radius;

  const CircularCornerContainer({Key key, @required this.child, this.height, this.width, this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.maxFinite,
      height: height ?? context.dynamicHeight(140),
      margin: context.mediumHorizontalEdgeInsets2,
      padding: context.homeContainerPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.dynamicHeight(radius ?? 30)),
        color: const Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            color: const Color(0x29000000),
            offset: Offset(0, 3),
            blurRadius: 10,
          ),
        ],
      ),
      child: child,
    );
  }
}
