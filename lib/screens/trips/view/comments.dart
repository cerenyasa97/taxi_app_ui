import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/components/project_rating_stars.dart';
import 'package:piton_taxi_app/core/components/project_text_button.dart';
import 'package:piton_taxi_app/core/components/project_text_field.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/core/init/project_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Comments extends StatelessWidget {
  final int rating;

  const Comments({Key key, this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData =
        Provider.of<ProjectThemeData>(context).getThemeData;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 10,
              child: Container(),
            ),
            Flexible(
              child: ProjectText(
                text: TextConstants.TRIP_REVIEW,
                style: themeData.textTheme.subtitle2,
              ),
              flex: 50,
            ),
            Flexible(
              child: Container(),
              flex: 50,
            ),
            Flexible(
              child: ProjectRatingStars(value: rating),
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
          child: ProjectTextField(
            contentPadding: context.lowEdgeInsetsAll,
            minLines: 4,
            enabledBorder: themeData.inputDecorationTheme.enabledBorder,
            focusedBorder: themeData.inputDecorationTheme.focusedBorder,
          ),
        ),
        Container(
          width: double.maxFinite,
          padding: context.lowEdgeInsetsHorizontal,
          alignment: Alignment.centerRight,
          child: ProjectTextButton(
            text: "Save",
            onPressed: () {},
            style: themeData.textTheme.headline4.copyWith(color: Colors.amber),
          ),
        )
      ],
    );
  }
}
