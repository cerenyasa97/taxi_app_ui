import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/core/init/navigation/navigation_service.dart';
import 'package:piton_taxi_app/core/init/navigation/pages_import.dart';
import 'package:piton_taxi_app/widgets/list_tile/custom_list_tile.dart';
import 'package:piton_taxi_app/core/extensions/theme/theme_extension.dart';
import 'package:flutter/material.dart';

class AddressesInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProjectTextLocale(
          text: LocaleKeys.profile_addressInformation_title,
          style:
              context.textTheme.bodyText1.copyWith(fontWeight: FontWeight.w700),
        ),
        CustomListTile(
          title: LocaleKeys.profile_addressInformation_addressesLabel,
          subtitle: LocaleKeys.profile_addressInformation_favoriteLabel,
          onTap: () => NavigationService.instance
              .navigatorPushSlidePage(context, Pages.ADDRESS),
        ),
      ],
    );
  }
}
