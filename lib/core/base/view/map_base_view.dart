import 'dart:async';
import 'package:piton_taxi_app/screens/search_location/model/location_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:piton_taxi_app/core/init/pages_import.dart';
import 'package:piton_taxi_app/screens/home/model/google_map_model.dart';
import 'package:piton_taxi_app/screens/home/view/google_map_background.dart';
import 'package:piton_taxi_app/widgets/custom_progress_indicator.dart';
import 'package:provider/provider.dart';

abstract class MapBaseView extends StatefulWidget {
  MapBaseView({Key key}) : super(key: key);
}

abstract class MapBaseState<Page extends MapBaseView> extends State<Page> {
  ValueNotifier<Map<MarkerId, Marker>> getMarkerListenable();

  String appBarTitle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Consumer<GoogleMapModel>(
            builder: (context, mapModel, child) {
              return mapModel.currentLocation != null
                  ? ValueListenableBuilder(
                  valueListenable: getMarkerListenable(), builder: (context, markerMap, child) {
                    return GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: mapModel.currentLocation.latLong,
                        zoom: 15,
                      ),
                      zoomControlsEnabled: false,
                      onMapCreated: (controller) => Provider.of<GoogleMapModel>(context, listen: false).mapController = controller,
                      markers: getMarkerListenable().value.values.toSet(),
                    );
              }
                  )
                  : CustomProgressIndicator();
            },
          ),
          Padding(
            padding: padding(),
            child: body(),
          ),
        ],
      ),
    );
  }

  Widget body();

  EdgeInsetsGeometry padding();
}
