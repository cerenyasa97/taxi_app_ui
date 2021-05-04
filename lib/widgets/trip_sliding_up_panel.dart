import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/extensions/edge_insets_extension.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class TripSlidingUpPanel extends StatelessWidget {

  final Widget panel;
  final double minHeight;
  final double maxHeight;

  const TripSlidingUpPanel({Key key, @required this.panel, this.minHeight, this.maxHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      padding: context.lowEdgeInsetsSymmetric,
      defaultPanelState: PanelState.OPEN,
      maxHeight: context.dynamicHeight(maxHeight ?? 0.27),
      minHeight: context.dynamicHeight(minHeight ?? (2 / 87)),
      panel: panel,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(context.dynamicWidth(30 / 412)),
          topRight: Radius.circular(context.dynamicWidth(30 / 412))),
    );
  }
}
