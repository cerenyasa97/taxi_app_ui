import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/init/pages_import.dart';
import 'package:piton_taxi_app/screens/home/utils/google_map_provider.dart';
import 'package:piton_taxi_app/widgets/custom_list_tile.dart';
import 'package:provider/provider.dart';

class UseCurrentLocation extends StatelessWidget {
  final VoidCallback onTap;

  const UseCurrentLocation({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      title: TextConstants.USE_CURRENT_LOCATION,
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
