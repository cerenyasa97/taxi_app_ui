import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/screens/profile/view/personal_information/personal_info_details.dart';
import 'package:piton_taxi_app/widgets/general/dotted_line.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/components/button/project_text_button.dart';
import 'package:piton_taxi_app/core/extensions/string/string_extension.dart';
import 'package:piton_taxi_app/core/extensions/theme/theme_extension.dart';
import 'profile_image/profile_image.dart';
import 'address_information/address_information.dart';
import 'package:piton_taxi_app/core/base/view/base_view.dart';
import 'package:flutter/material.dart';
import 'language_information/app_settings.dart';

class Profile extends BaseView{
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends BaseState<Profile>{
  @override
  String appBarTitle() => LocaleKeys.profile_title;

  @override
  Widget body() {
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileImage(),
            SizedBox(
              height: context.dynamicHeight(30),
            ),
            PersonalInfoDetails(),
            DottedLine(context.dynamicWidth(16),
                context.dynamicWidth(16), 0, context.dynamicWidth(10)),
            AddressesInformation(),
            DottedLine(context.dynamicWidth(16),
                context.dynamicWidth(16), 0, context.dynamicWidth(10)),
            AppSettings(),
            DottedLine(context.dynamicWidth(16),
                context.dynamicWidth(16), context.dynamicWidth(10), 0),
            Padding(
              padding: context.lowestEdgeInsetsHorizontal,
              child: ProjectTextButton(
                  text: LocaleKeys.profile_logOutTitle.locale,
                  style: context.textTheme.subtitle2.copyWith(color: Colors.amber.shade600),
                  onPressed: () {}),
            )
          ],
        ),
    );
  }

  @override
  EdgeInsetsGeometry padding() => context.lowEdgeInsetsAll;
}