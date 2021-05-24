import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/widgets/list_tile/custom_list_tile.dart';
import 'package:piton_taxi_app/core/init/navigation/pages_import.dart';
import 'package:flutter/material.dart';

class UseCurrentLocation extends StatelessWidget {
  final VoidCallback onTap;

  const UseCurrentLocation({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      title: LocaleKeys.searchLocation_useCurrentLocation,
      titleBold: false,
      leadingIcon: Icon(
        Icons.my_location,
        color: Colors.black,
        size: 30,
      ),
      onTap: onTap,
    );
  }
}
