import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:piton_taxi_app/screens/home/view/trip_description_panel/trip_description_header.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class TripSlidingUpPanel extends StatelessWidget {

  final Widget panel;
  final double minHeight;
  final double maxHeight;
  final Widget header;
  final Color color;

  const TripSlidingUpPanel({Key key, @required this.panel, this.minHeight, this.maxHeight, this.header, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      color: color ?? ProjectConstants.LIGHT_WHITE,
      defaultPanelState: PanelState.OPEN,
      maxHeight: context.dynamicHeight(maxHeight ?? 260),
      minHeight: context.dynamicHeight(minHeight ?? 15),
      header: Container(
        padding: context.lowEdgeInsetsVertical,
        width: context.width,
        height: context.dynamicHeight(20),
        child: Center(child: TripDescriptionHeader(),),
      ),
      panel: panel,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(context.dynamicWidth(30)),
          topRight: Radius.circular(context.dynamicWidth(30))),
    );
  }
}
