import 'dart:async';

import 'package:piton_taxi_app/screens/search_location/model/location_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:piton_taxi_app/core/init/pages_import.dart';
import 'package:piton_taxi_app/screens/home/model/google_map_model.dart';
import 'package:provider/provider.dart';

abstract class MapBaseView extends StatefulWidget {
  MapBaseView({Key key}) : super(key: key);
}

abstract class MapBaseState<Page extends MapBaseView> extends State<Page> {
  GoogleMapController mapController;
  Map<MarkerId, Marker> markerMap = Map<MarkerId, Marker>();
  // ignore: close_sinks
  StreamController<Map<MarkerId, Marker>> markerStreamController = StreamController<Map<MarkerId, Marker>>();
  Stream<Map<MarkerId, Marker>> get markerStream =>
      markerStreamController.stream;
  //ValueNotifier<Map<MarkerId, Marker>> listenableMapMarker = ValueNotifier<Map<MarkerId, Marker>>({});

  String appBarTitle();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    markerStreamController.sink.add(markerMap);
  }

  @override
  Widget build(BuildContext context) {
    final GoogleMapModel mapModel =
        Provider.of<GoogleMapModel>(context, listen: false);
    return Scaffold(
      body: Stack(
        children: [
          StreamBuilder(
              stream: markerStream,
              builder: (context, snapshot) {
            return GoogleMap(
              initialCameraPosition: CameraPosition(
                target: mapModel.currentLocation.latLong,
                zoom: 15,
              ),
              zoomControlsEnabled: false,
              onMapCreated: (controller) => mapController = controller,
              markers: Set<Marker>.from(snapshot.data != null ? snapshot.data.values : <Marker>[]),
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              onTap: onTap,
              onCameraMove: onCameraMove,
            );
          }),
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

  onTap(LatLng location);

  onCameraMove(CameraPosition position);
}
/*
ValueListenableBuilder(
              valueListenable: listenableMapMarker,
              builder: (context, markerMap, child) {
                return GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: mapModel.currentLocation.latLong,
                    zoom: 15,
                  ),
                  zoomControlsEnabled: false,
                  onMapCreated: (controller) => mapController = controller,
                  markers: Set.from(listenableMapMarker.value.values),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  onTap: onTap,
                  onCameraMove: onCameraMove,
                );
              }
          ),
 */
