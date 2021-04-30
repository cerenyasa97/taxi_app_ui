import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/init/pages_import.dart';
import 'package:piton_taxi_app/core/init/project_routes.dart';
import 'package:piton_taxi_app/screens/search_location/model/location_model.dart';
import 'package:piton_taxi_app/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class SelectLocationOnMapWidget extends StatelessWidget {
  final GlobalKey<SearchLocationState> searchLocationKey;

  const SelectLocationOnMapWidget({Key key, this.searchLocationKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      title: TextConstants.SELECT_ON_MAP,
      titleBold: false,
      leadingIcon: Icon(
        Icons.add_location_alt_outlined,
        color: Colors.black,
        size: 30,
      ),
      onTap: () {
        Navigator.of(context)
            .push(ProjectRoute.generateSlidePageRouteBuilder(
                Pages.SELECT_LOCATION_ON_MAP,
                ProjectConstants.FAST_PAGE_TRANSITION_DURATION,
                variable: searchLocationKey))
            .then((location) {
          searchLocationKey.currentState.location = location;
          searchLocationKey.currentState.controller.text = location.name;
        });
      },
    );
  }
}
