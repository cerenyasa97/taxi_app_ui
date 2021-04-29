import 'package:piton_taxi_app/screens/profile/view/contact_information/contact_details.dart';
import 'file:///C:/Users/Ceren/Desktop/piton_taxi_app/lib/widgets/dotted_line.dart';
import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/extensions/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/components/project_text_button.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/extensions/theme_extension.dart';
import 'package:piton_taxi_app/widgets/circle_image.dart';
import 'address_information/address_information.dart';
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
        SizedBox(
          height: context.dynamicHeight(3 / 87),
        ),
        ContactDetails(),
        DottedLine(context.dynamicWidth(16 / 412),
            context.dynamicWidth(16 / 412), 0, context.dynamicWidth(10 / 412)),
        AddressesInformation(),
        DottedLine(context.dynamicWidth(16 / 412),
            context.dynamicWidth(16 / 412), context.dynamicWidth(10 / 412), 0),
        Padding(
          padding: context.lowestEdgeInsetsHorizontal,
          child: ProjectTextButton(
              text: TextConstants.PROFILE_LOG_OUT,
              style: context.textTheme.subtitle2.copyWith(color: Colors.black87),
              onPressed: () {}),
        )
      ],
    );
  }
}