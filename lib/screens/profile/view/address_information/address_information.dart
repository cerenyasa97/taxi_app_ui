import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:piton_taxi_app/core/init/pages_import.dart';
import 'package:piton_taxi_app/core/init/project_routes.dart';
import 'package:piton_taxi_app/widgets/custom_list_tile.dart';
import 'package:piton_taxi_app/core/init/project_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class AddressesInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProjectText(
          text: TextConstants.PROFILE_ADDRESS,
          style: Provider.of<ProjectThemeData>(context)
              .getThemeData
              .textTheme
              .bodyText1
              .copyWith(fontWeight: FontWeight.w700),
        ),
        CustomListTile(
          title: TextConstants.ADDRESSES_TITLE,
          subtitle: TextConstants.ADDRESSES_SUBTITLE,
          onTap: () => Navigator.of(context).push(
              ProjectRoute.generateSlidePageRouteBuilder(Pages.ADDRESS,
                  ProjectConstants.FAST_PAGE_TRANSITION_DURATION)),
        ),
      ],
    );
  }
}
