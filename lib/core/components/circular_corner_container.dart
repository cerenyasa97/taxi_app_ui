import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:flutter/material.dart';

class CircularCornerContainer extends StatelessWidget {

  final Widget child;

  const CircularCornerContainer({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      margin: context.mediumHorizontalEdgeInsets2,
      padding: context.homeContainerPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.dynamicHeight(3/87)),
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
