import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:flutter/material.dart';

class ProjectImage extends StatelessWidget {
  final String imagePath;
  final BoxFit fit;
  final double width;
  final double height;

  const ProjectImage(
      {Key key, @required this.imagePath, this.fit, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      fit: fit,
      width: width ?? context.dynamicWidth(50),
      height: height ?? context.dynamicWidth(50),
    );
  }
}
