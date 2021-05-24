import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {

  final double width;
  final double radius;
  final String image;

  const CircleImage({Key key, this.width, this.image, this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dynamicWidth(width ?? 60),
      height: context.dynamicWidth(width ?? 60),
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.circular(context.dynamicWidth(radius ?? 50)),
          border: Border.all(color: Colors.grey),
          image: DecorationImage(
              image: AssetImage(image ?? ImageConstants.USER_IMAGE)
          )
      ),
    );
  }
}
