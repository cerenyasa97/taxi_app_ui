import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:piton_taxi_app/core/constants/app/custom_text_style.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/constants/dummy_data.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/init/project_routes.dart';
import 'package:piton_taxi_app/widgets/custom_list_tile.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';

class ContactDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProjectText(
          text: TextConstants.PROFILE_CONTACT_INFORMATION,
          style: CustomTextStyle.profileSectionLabelStyle,
        ),
        CustomListTile(
          title: TextConstants.PROFILE_NAME_LABEL,
          subtitle: DummyData.NAME_SURNAME,
          onTap: () => _pageNavigation(context, Pages.CHANGE_NAME_SURNAME),
        ),
        CustomListTile(
          title: TextConstants.PROFILE_EMAIL_LABEL,
          subtitle: DummyData.EMAIL,
          onTap: () => _pageNavigation(context, Pages.CHANGE_EMAIL),
        ),
        CustomListTile(
          title: TextConstants.PROFILE_PHONE_LABEL,
          subtitle: DummyData.PHONE,
          onTap: () => _pageNavigation(context, Pages.CHANGE_PHONE),
        )
      ],
    );
  }

  _pageNavigation(BuildContext context, var page) {
    Navigator.of(context).push(ProjectRoute.generateSlidePageRouteBuilder(page, ProjectConstants.FAST_PAGE_TRANSITION_DURATION));
  }
}
