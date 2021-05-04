import 'package:piton_taxi_app/widgets/trip_sliding_up_panel.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/init/pages_import.dart';
import 'package:piton_taxi_app/core/extensions/theme_extension.dart';
import 'trip_description_header.dart';
import 'package:piton_taxi_app/widgets/loading_alert_dialog.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/widgets/amber_button.dart';
import 'package:piton_taxi_app/screens/trips/view/trip_detail_body.dart';


class TripDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle style = context.textTheme.headline5
        .copyWith(color: Colors.black87, fontWeight: FontWeight.w500);
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: TripSlidingUpPanel(
        panel: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: TripDescriptionHeader(),
              flex: 1,
            ),
            Flexible(
              child: ProjectText(
                text: TextConstants.TRIP_INFO,
                style: style,
              ),
              flex: 2,
            ),
            Flexible(
              child: Center(
                child: TripDetailBody(
                  height: 10 / 87,
                ),
              ),
              flex: 10,
            ),
            Flexible(
              child: AmberButton(
                text: TextConstants.START_TRIP_BUTTON,
                onPressed: () {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => LoadingAlertDialog());
                },
              ),
              flex: 5,
            )
          ],
        ),
      ),
    );
  }
}
