import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/base/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/init/languages/languages_manager.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/widgets/list_tile/custom_list_tile.dart';
import 'package:easy_localization/easy_localization.dart';

class ChangeLanguage extends BaseView {
  @override
  _ChangeLanguageState createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends BaseState<ChangeLanguage> {
  String language;

  @override
  String appBarTitle() => LocaleKeys.profile_languageInformation_changeLanguage;

  @override
  Widget body() {
    return Column(
      children: List.generate(
        LanguagesManager.instance.supportedLocales.length,
        (index) {
          _getLanguage(index);
          return CustomListTile(
            title: language,
            trailingIcon: Icon(
              Icons.done,
              color: LanguagesManager.instance.supportedLocales[index] ==
                      context.locale
                  ? Colors.black87
                  : Colors.white,
            ),
            onTap: () {
              setState(() {
                context.setLocale(LanguagesManager.instance.supportedLocales[index]);
              });
            },
          );
        },
      ),
    );
  }

  @override
  EdgeInsetsGeometry padding() => context.mediumEdgeInsetsSymmetric;

  void _getLanguage(int index) {
    language = LanguagesManager.instance.supportedLocales[index] ==
            LanguagesManager.instance.trLocale
        ? LocaleKeys.profile_languageInformation_tr
        : LocaleKeys.profile_languageInformation_en;
  }
}
