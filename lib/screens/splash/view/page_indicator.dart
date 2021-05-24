import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {

  final int index;

  const PageIndicator({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dynamicWidth(120),
      child: Row(
        children: List.generate(ProjectConstants.SPLASH_SCREEN_COUNT, (index) => Container(
          margin: context.lowest2EdgeInsetsAll,
          width: context.dynamicWidth(15),
          height: context.dynamicHeight(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.dynamicWidth(15)),
            border: Border.all(color: Colors.amber, width: context.dynamicWidth(2)),
            color: this.index == index ? Colors.amber : Colors.white,
          ),
        )),
      ),
    );
  }
}