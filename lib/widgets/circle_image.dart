import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {

  final double width;
  final int radius;
  final String image;

  const CircleImage({Key key, this.width, this.image, this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dynamicWidth((width ?? 60)/412),
      height: context.dynamicWidth((width ?? 60)/412),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.dynamicWidth(context.dynamicWidth((radius ?? 50)/412))),
          border: Border.all(color: Colors.grey),
          image: DecorationImage(
              image: AssetImage(image ?? ImageConstants.USER_IMAGE)
          )
      ),
    );
  }
}
