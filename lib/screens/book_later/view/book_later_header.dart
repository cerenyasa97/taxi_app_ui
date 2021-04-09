import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/core/constants/app/custom_text_style.dart';
import 'package:piton_taxi_app/core/extensions/date_time_extension.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/components/project_svg_image.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/core/init/pages_import.dart';
import 'package:flutter/material.dart';

class BookLaterHeader extends StatelessWidget {

  final DateTime date;

  const BookLaterHeader({Key key, @required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.medium1EdgeInsetsSymmetric,
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ProjectSVGImage(
              imagePath: ImageConstants.SLIDING_UP_PANEL_ICON,
            ),
          ),
          Center(
              child: ProjectText(
                text: TextConstants.SLIDING_UP_PANEL_HINT,
                style: CustomTextStyle.hintTextStyle,
              )),
          context.lowSizedBoxHeight,
          _getDateTime(TextConstants.DATE, date.dateString),
          context.lowestSizedBoxHeight,
          _getDateTime(TextConstants.TIME, date.timeString)
        ],
      ),
    );
  }

  Row _getDateTime(String label, String value) {
    return Row(
          children: [
            ProjectText(text: label, style: CustomTextStyle.yellowTextStyle,),
            ProjectText(text: value, style: CustomTextStyle.blackTextStyle,)
          ],
        );
  }
}
