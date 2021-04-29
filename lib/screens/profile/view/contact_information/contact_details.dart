import 'package:piton_taxi_app/core/constants/dummy_data/dummy_data.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:piton_taxi_app/widgets/custom_list_tile.dart';
import 'package:piton_taxi_app/core/init/project_routes.dart';
import 'package:piton_taxi_app/core/init/project_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ContactDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProjectText(
          text: TextConstants.PROFILE_CONTACT_INFORMATION,
          style: Provider.of<ProjectThemeData>(context).getThemeData.textTheme.subtitle2.copyWith(fontWeight: FontWeight.w800),
        ),
        CustomListTile(
          title: TextConstants.PROFILE_NAME_LABEL,
          subtitle: DummyData.user_1.nameSurname,
          onTap: () => _pageNavigation(context, Pages.CHANGE_NAME_SURNAME),
        ),
        CustomListTile(
          title: TextConstants.PROFILE_EMAIL_LABEL,
          subtitle: DummyData.user_1.email,
          onTap: () => _pageNavigation(context, Pages.CHANGE_EMAIL),
        ),
        CustomListTile(
          title: TextConstants.PROFILE_PHONE_LABEL,
          subtitle: DummyData.user_1.phoneNumber,
          onTap: () => _pageNavigation(context, Pages.CHANGE_PHONE),
        )
      ],
    );
  }

  _pageNavigation(BuildContext context, var page) {
    Navigator.of(context).push(ProjectRoute.generateSlidePageRouteBuilder(page, ProjectConstants.FAST_PAGE_TRANSITION_DURATION));
  }
}