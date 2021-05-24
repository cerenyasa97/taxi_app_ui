import 'package:piton_taxi_app/core/components/button/project_circular_button.dart';
import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:flutter/material.dart';

class NextPageButton extends StatelessWidget {
  final VoidCallback onTap;
  final double iconSize;

  const NextPageButton({Key key, @required this.onTap, this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProjectCircularButton(
      onPressed: onTap,
      child: Icon(
        Icons.arrow_forward,
        size: iconSize ?? 30,
        color: Colors.white,
      ),
      padding: context.lowestEdgeInsetsAll,
      color: Colors.amber,
    );
  }
}