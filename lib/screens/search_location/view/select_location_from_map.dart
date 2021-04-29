import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class SelectLocationFromMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      title: TextConstants.SELECT_FROM_MAP,
      titleBold: false,
      leadingIcon: Icon(
        Icons.add_location_alt_outlined,
        color: Colors.black,
        size: 30,
      ),
      onTap: () {},
    );
  }
}
