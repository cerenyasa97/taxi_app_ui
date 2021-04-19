import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/components/project_elevated_button.dart';
import 'package:piton_taxi_app/screens/profile/view/contact_details.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/widgets/circle_image.dart';
import 'package:piton_taxi_app/utils/DottedLine.dart';

import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: CircleImage(width: 100, radius: 60),
        ),
        SizedBox(height: context.dynamicHeight(3/87),),
        ContactDetails(),
        DottedLine(16, 16, 0, 0),
        ProjectElevatedButton(onPressed: () {}, text: TextConstants.PROFILE_LOG_OUT),
      ],
    );
  }
}
