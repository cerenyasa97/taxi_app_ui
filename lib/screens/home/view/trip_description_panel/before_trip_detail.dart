import 'package:piton_taxi_app/core/components/button/project_text_button.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/screens/book_later/view/book_later_dialog.dart';
import 'package:piton_taxi_app/core/components/button/project_elevated_button.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/core/components/image/project_image.dart';
import 'package:piton_taxi_app/widgets/alert_dialogs/loading_alert_dialog.dart';
import 'package:piton_taxi_app/widgets/general/trip_information.dart';
import 'package:piton_taxi_app/widgets/buttons/amber_button.dart';
import '../../../../widgets/general/trip_route.dart';
import 'package:flutter/material.dart';



class BeforeTripDetail extends StatefulWidget {
  const BeforeTripDetail({Key key}) : super(key: key);

  @override
  _BeforeTripDetailState createState() => _BeforeTripDetailState();
}

class _BeforeTripDetailState extends State<BeforeTripDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TripRoute(),
        TripInformation(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ProjectTextButton(
                onPressed: () => showDialog(
                    context: context,
                    builder: (context) => BookLaterDialog()),
                child: ProjectImage(
                    imagePath: ImageConstants.CALENDAR_ICON, width: 40)),
            AmberButton(
              width: 250,
              text: LocaleKeys.button_labels_start_trip,
              onPressed: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => LoadingAlertDialog());
              },
            ),
          ],
        )
      ],
    );
  }
}
