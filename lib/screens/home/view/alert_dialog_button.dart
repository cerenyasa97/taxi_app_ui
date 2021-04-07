import 'package:piton_taxi_app/core/components/project_circular_button.dart';
import 'package:flutter/material.dart';

class AlertDialogButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final Color color;

  const AlertDialogButton(
      {Key key, @required this.icon, this.color, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProjectCircularButton(
        onPressed: onPressed,
        child: Icon(
          icon,
          color: color ?? Colors.white,
        ));
  }
}
