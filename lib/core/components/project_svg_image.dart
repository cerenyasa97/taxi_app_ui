import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class ProjectSVGImage extends StatelessWidget {
  final String imagePath;

  const ProjectSVGImage({Key key, @required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(imagePath);
  }
}
