import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:flutter/material.dart';

class MenuBackground extends StatelessWidget {
  const MenuBackground({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.0, 0.0),
            radius: context.dynamicWidth(0.8),
            colors: [const Color(0xffebcc49), const Color(0xffffc107)],
            stops: [0.0, 1.0],
          )),
    );
  }
}
