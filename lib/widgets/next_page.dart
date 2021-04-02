import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {

  final VoidCallback onTap;

  const NextPage({Key key, @required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        width: context.dynamicWidth(50/412),
        height: context.dynamicWidth(50/412),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
          color: const Color(0xffffc107),
          boxShadow: [
            BoxShadow(
              color: const Color(0x29000000),
              offset: Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: Icon(Icons.arrow_forward_outlined, color: Colors.white, size: 30,),
      ),
    );
  }
}
