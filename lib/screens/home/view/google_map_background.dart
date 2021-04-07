import 'package:flutter/cupertino.dart';
import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class GoogleMapBackground extends StatefulWidget {
  final MapType mapType;

  const GoogleMapBackground({Key key, @required this.mapType})
      : super(key: key);

  @override
  _GoogleMapBackgroundState createState() => _GoogleMapBackgroundState();
}

class _GoogleMapBackgroundState extends State<GoogleMapBackground> {
  Completer<GoogleMapController> _controller;
  BitmapDescriptor taxiIcon;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = Completer();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition:
      CameraPosition(target: ProjectConstants.CURRENT_LOCATION, zoom: 15),
      mapType: widget.mapType,
      onMapCreated: (controller) async {
        await createMarker();
        setState(() {});
      },
      markers: _getMarkers(),
    );
  }

  createMarker() async {
    if (taxiIcon == null) {
      ImageConfiguration configuration = createLocalImageConfiguration(context);
      taxiIcon = await BitmapDescriptor.fromAssetImage(
          configuration, ImageConstants.TAXI_ICON);
      setState(() {});
    }
  }

  _getMarkers() {
    return [
      Marker(
          position: ProjectConstants.CURRENT_LOCATION,
          markerId: MarkerId("me"),
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueOrange)),
      /*Marker(position: LatLng(39.753055, 30.492381),
        markerId: MarkerId("taxi1"),
          icon: taxiIcon
        )*/
    ].toSet();
  }
}
