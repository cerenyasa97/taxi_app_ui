import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/components/rating_stars/project_rating_stars.dart';
import 'package:piton_taxi_app/core/extensions/theme/theme_extension.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/core/init/theme/project_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class DriverComment extends StatelessWidget {
  final int rating;

  const DriverComment({Key key, this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData =
        Provider.of<ProjectThemeData>(context).themeData;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 10,
              child: Container(),
            ),
            Expanded(
              child: ProjectTextLocale(
                text: LocaleKeys.trips_tripDetails_reviewTitle,
                style: themeData.textTheme.subtitle2,
              ),
              flex: 50,
            ),
            Flexible(
              child: Container(),
              flex: 50,
            ),
            Flexible(
              child: StarRating(
                value: 4,
                onChanged: (index) {},
                size: context.dynamicHeight(22),
              ),
              flex: 70,
            ),
            Flexible(
              flex: 5,
              child: Container(),
            )
          ],
        ),
        Padding(
          padding: context.mediumEdgeInsetsSymmetric,
          child: Container(
            height: context.dynamicHeight(170),
            padding: context.lowestEdgeInsetsAll,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(context.dynamicWidth(5)),
              border: Border.all(width: 1, color: Colors.grey),
            ),
            child: ProjectTextLocale(
              text: LocaleKeys.trips_tripDetails_noComment,
              maxLines: 5,
              style: context.textTheme.bodyText1
                  .copyWith(color: Colors.grey.shade700),
            ),
          ),
        ),
      ],
    );
  }
}
