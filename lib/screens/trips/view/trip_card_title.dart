import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/core/init/theme/project_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class TripCardTitle extends StatelessWidget {

  final String date;
  final String status;

  const TripCardTitle({Key key, @required this.date, @required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Provider.of<ProjectThemeData>(context).themeData.textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProjectTextLocale(
          text: date,
          style: textTheme.bodyText1,
        ),
        ProjectTextLocale(
          text: status.toUpperCase(),
          style: textTheme.headline4.copyWith(color: Colors.amber),
        )
      ],
    );
  }
}
