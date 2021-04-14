import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/core/constants/app/custom_text_style.dart';

class TripCardTitle extends StatelessWidget {

  final String date;
  final String status;

  const TripCardTitle({Key key, @required this.date, @required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProjectText(
          text: date,
          style: CustomTextStyle.black16w6,
        ),
        ProjectText(
          text: status.toUpperCase(),
          style: CustomTextStyle.amber20w8,
        )
      ],
    );
  }
}
