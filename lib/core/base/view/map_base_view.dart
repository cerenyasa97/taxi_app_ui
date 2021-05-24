import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/screens/search_location/model/location_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:piton_taxi_app/core/init/navigation/pages_import.dart';
import 'package:piton_taxi_app/core/extensions/maps/maps_extension.dart';
import 'package:piton_taxi_app/widgets/progress_indicator/custom_progress_indicator.dart';

abstract class MapBaseView extends StatefulWidget {
  MapBaseView({Key key}) : super(key: key);
}

abstract class MapBaseState<Page extends MapBaseView> extends State<Page> {
  String _mapStyle;
  GoogleMapController mapController;
  Map<MarkerId, Marker> markerMap = Map<MarkerId, Marker>();

  // ignore: close_sinks
  StreamController<Map<MarkerId, Marker>> markerStreamController =
      StreamController<Map<MarkerId, Marker>>();

  Stream<Map<MarkerId, Marker>> get markerStream =>
      markerStreamController.stream;

  //ValueNotifier<Map<MarkerId, Marker>> listenableMapMarker = ValueNotifier<Map<MarkerId, Marker>>({});

  String appBarTitle();

  @override
  void initState() {
    super.initState();
    setMapStyle();
    markerStreamController.sink.add(markerMap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          StreamBuilder(
              stream: markerStream,
              builder: (context, snapshot) {
                return context.mapProvider.currentLocation == null
                    ? CustomProgressIndicator()
                    : GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: context.mapProvider.currentLocation.latLong,
                          zoom: 15,
                        ),
                        zoomControlsEnabled: false,
                        onMapCreated: (controller) {
                          mapController = controller;
                          mapController.setMapStyle(_mapStyle);
                        },
                        markers: Set<Marker>.from(snapshot.data != null
                            ? snapshot.data.values
                            : <Marker>[]),
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

  setMapStyle() {
    rootBundle
        .loadString(TextConstants.MAP_STYLE_PATH)
        .then((value) => _mapStyle = value);
  }
}
