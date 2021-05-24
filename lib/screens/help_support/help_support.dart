import 'package:piton_taxi_app/core/components/button/project_circular_button.dart';
import 'package:piton_taxi_app/core/components/image/project_image.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/core/components/button/project_text_button.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/base/view/base_view.dart';
import 'package:piton_taxi_app/core/extensions/theme/theme_extension.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/core/extensions/string/string_extension.dart';

class HelpSupport extends BaseView {
  @override
  _HelpSupportState createState() => _HelpSupportState();
}

class _HelpSupportState extends BaseState<HelpSupport> {
  @override
  String appBarTitle() => LocaleKeys.helpSupport_title;

  @override
  Widget body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _getTextSection(
            LocaleKeys.helpSupport_about_title, LocaleKeys.helpSupport_about_body, 15),
        _getTextSection(
            LocaleKeys.helpSupport_passenger_title, LocaleKeys.helpSupport_passenger_body, 15),
        _getTextSection(LocaleKeys.helpSupport_taxiAppInfo_title,
            LocaleKeys.helpSupport_taxiAppInfo_body.locale.split(".")[0] + ".", 10),
        _getTextSection(
            LocaleKeys.helpSupport_termsAndConditions_title, LocaleKeys.helpSupport_termsAndConditions_body, 5),
        Expanded(
          flex: 3,
          child: Container(),
        ),
        Flexible(
          flex: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProjectCircularButton(
                onPressed: () {},
                child: ProjectImage(
                  imagePath: ImageConstants.FACEBOOK_ICON,
                ),
                color: Colors.blueAccent,
              ),
              ProjectCircularButton(
                onPressed: () {},
                child: ProjectImage(
                  imagePath: ImageConstants.TWITTER_ICON,
                ),
                color: Colors.lightBlueAccent,
              ),
              ProjectCircularButton(
                onPressed: () {},
                child: ProjectImage(
                  imagePath: ImageConstants.INSTAGRAM_ICON,
                ),
                color: Colors.purple,
              ),
            ],
          ),
        ),
        Flexible(
            flex: 4,
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: ProjectTextButton(
                onPressed: () {},
                text: LocaleKeys.helpSupport_customerSupport,
                style:
                    context.textTheme.headline5.copyWith(color: Colors.amber),
              ),
            )),
        Flexible(
            flex: 4,
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: ProjectTextButton(
                onPressed: () {},
                text: LocaleKeys.helpSupport_emailUs,
                style: context.textTheme.headline5,
              ),
            ))
      ],
    );
  }

  @override
  EdgeInsetsGeometry padding() => context.mediumEdgeInsetsSymmetric;

  _getTextSection(String title, String body, int flex) {
    final titleStyle = context.textTheme.headline6;
    final bodyStyle =
        context.textTheme.bodyText2.copyWith(color: Colors.grey.shade700);
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProjectTextLocale(
            text: title,
            style: titleStyle,
          ),
          Flexible(
              child: ProjectTextLocale(
            maxLines: 10,
            text: body,
            style: bodyStyle,
          ))
        ],
      ),
      flex: flex,
    );
  }
}
