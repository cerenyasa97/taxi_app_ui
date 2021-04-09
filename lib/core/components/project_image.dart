import 'package:flutter/material.dart';

class ProjectImage extends StatelessWidget {
  final String imagePath;
  final BoxFit fit;

  const ProjectImage({Key key, @required this.imagePath, this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      fit: fit ?? null,
    );
  }
}
