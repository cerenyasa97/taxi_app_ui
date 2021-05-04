import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/components/project_svg_image.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';

class TripDescriptionHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ProjectSVGImage(
              imagePath: ImageConstants.SLIDING_UP_PANEL_ICON,
            ),
          ),
    ]
    );
  }
}
