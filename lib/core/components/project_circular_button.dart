import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:flutter/material.dart';

class ProjectCircularButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color color;

  const ProjectCircularButton(
      {Key key, @required this.onPressed, @required this.child, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: context.lowEdgeInsets,
        child: child,
      ),
      style: ElevatedButton.styleFrom(
          shape: CircleBorder(), primary: color ?? Colors.amber),
    );
  }
}
