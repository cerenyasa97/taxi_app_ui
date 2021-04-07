import 'package:piton_taxi_app/core/components/project_elevated_button.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/components/circular_corner_container.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'location_search_alert_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class WhereFromTo extends StatefulWidget {
  @override
  _WhereFromToState createState() => _WhereFromToState();
}

class _WhereFromToState extends State<WhereFromTo> {
  String _from, _to;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _from = TextConstants.WHERE_FROM;
    _to = TextConstants.WHERE_TO;
  }

  @override
  Widget build(BuildContext context) {
    return CircularCornerContainer(
      child: Row(
        children: [
          Flexible(
            child: SvgPicture.asset(ImageConstants.ROUTE_ICON),
            flex: 8,
          ),
          Flexible(
            child: Container(),
            flex: 10,
          ),
          Flexible(
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildProjectElevatedButton(_from, TextConstants.WHERE_FROM),
                  Divider(
                    thickness: 0.5,
                  ),
                  buildProjectElevatedButton(_to, TextConstants.WHERE_TO),
                ],
              ),
            ),
            flex: 95,
          )
        ],
      ),
    );
  }

  ProjectElevatedButton buildProjectElevatedButton(String text, String title,) {
    return ProjectElevatedButton(
                  text: text,
                  onPressed: () {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return LocationSearchAlertDialog(
                              title: title ,
                              onChanged: (text) {
                                setState(() {
                                  text = text;
                                });
                              },
                              initialText: (text == TextConstants.WHERE_FROM || text == TextConstants.WHERE_TO) ? "" : text);
                        });
                  },
                );
  }
}
