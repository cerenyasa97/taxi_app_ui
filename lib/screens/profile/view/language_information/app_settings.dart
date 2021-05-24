import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:piton_taxi_app/core/extensions/theme/theme_extension.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/core/init/navigation/navigation_service.dart';
import 'package:piton_taxi_app/widgets/list_tile/custom_list_tile.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      ProjectTextLocale(
      text: LocaleKeys.profile_languageInformation_title,
      style:
      context.textTheme.bodyText1.copyWith(fontWeight: FontWeight.w700),
    ),
    CustomListTile(
    title: LocaleKeys.profile_languageInformation_selectedLanguage,
    subtitle: context.locale == Locale("tr", "TR")
    ? LocaleKeys.profile_languageInformation_tr
        : LocaleKeys.profile_languageInformation_en,
    onTap: () => NavigationService.instance
        .navigatorPushSlidePage(context, Pages.CHANGE_LANGUAGE)),
    ],
    );
  }
}
