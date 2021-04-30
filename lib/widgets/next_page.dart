import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:flutter/material.dart';

class NextPageButton extends StatelessWidget {

  final VoidCallback onTap;
  final double width;

  const NextPageButton({Key key, @required this.onTap, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        width: context.dynamicWidth((width ?? 50)/412),
        height: context.dynamicWidth((width ?? 50)/412),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(context.dynamicWidth((width ?? 50)/412))),
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
