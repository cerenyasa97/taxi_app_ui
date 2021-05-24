import 'package:piton_taxi_app/core/constants/dummy_data/dummy_data.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/core/init/navigation/navigation_service.dart';
import 'package:piton_taxi_app/widgets/list_tile/custom_list_tile.dart';
import 'package:piton_taxi_app/core/init/theme/project_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class PersonalInfoDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProjectTextLocale(
          text: LocaleKeys.profile_contactInformation_title,
          style: Provider.of<ProjectThemeData>(context)
              .themeData
              .textTheme
              .bodyText1
              .copyWith(fontWeight: FontWeight.w700),
        ),
        CustomListTile(
          title: LocaleKeys.profile_contactInformation_nameSurnameLabel,
          subtitle: DummyData.user_1.nameSurname,
          onTap: () => _pageNavigation(context, Pages.CHANGE_NAME_SURNAME),
        ),
        CustomListTile(
          title: LocaleKeys.profile_contactInformation_emailLabel,
          subtitle: DummyData.user_1.email,
          onTap: () => _pageNavigation(context, Pages.CHANGE_EMAIL),
        ),
        CustomListTile(
          title: LocaleKeys.profile_contactInformation_phoneLabel,
          subtitle: DummyData.user_1.phoneNumber,
          onTap: () => _pageNavigation(context, Pages.CHANGE_PHONE),
        )
      ],
    );
  }

  _pageNavigation(BuildContext context, var page) {
    NavigationService.instance.navigatorPushSlidePage(context, page);
  }
}
