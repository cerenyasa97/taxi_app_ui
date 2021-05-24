import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/components/button/project_circular_button.dart';

class MenuIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final Widget child;
  final Color color;
  final double size;

  const MenuIconButton(
      {Key key, @required this.onPressed, this.icon, this.color, this.child, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProjectCircularButton(
      onPressed: onPressed,
      child: child ??
          Icon(
            icon,
            size: size ?? 30,
            color: Colors.black54,
          ),
      color: color ?? Color(0xFFF8F8F8),
    );
  }
}
