import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/core/init/navigation/navigation_service.dart';
import 'package:piton_taxi_app/widgets/list_tile/custom_list_tile.dart';
import 'package:piton_taxi_app/core/init/navigation/pages_import.dart';
import 'package:flutter/material.dart';

class SelectLocationOnMapWidget extends StatelessWidget {
  final GlobalKey<SearchLocationState> searchLocationKey;

  const SelectLocationOnMapWidget({Key key, this.searchLocationKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      title: LocaleKeys.searchLocation_selectOnMap_title,
      titleBold: false,
      leadingIcon: Icon(
        Icons.add_location_alt_outlined,
        color: Colors.black,
        size: 30,
      ),
      onTap: () {
        NavigationService.instance.navigatorPushSlidePage(context, Pages.SELECT_LOCATION_ON_MAP, variable: searchLocationKey)
            .then((location) {
              debugPrint("*************************************************\nIn select location on map" + location.toString());
          searchLocationKey.currentState.location = location;
          searchLocationKey.currentState.controller.text = location.name;
        });
      },
    );
  }
}
