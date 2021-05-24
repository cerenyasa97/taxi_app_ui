import 'package:piton_taxi_app/core/components/image/project_image.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/core/init/navigation/pages_import.dart';

class CustomProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ProjectImage(
        imagePath: ImageConstants.PROGRESS_INDICATOR,
        width: context.dynamicWidth(100),
      ),
    );
  }
}
