import 'package:piton_taxi_app/screens/search_location/model/location_model.dart';
import 'package:piton_taxi_app/screens/home/utils/google_map_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoogleMapBackground extends StatefulWidget {
  @override
  _GoogleMapBackgroundState createState() => _GoogleMapBackgroundState();
}

class _GoogleMapBackgroundState extends State<GoogleMapBackground> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GoogleMapProvider>(
      builder: (context, googleMapModel, child) {
        return googleMapModel.currentLocation == null
            ? Center(
                child: CircularProgressIndicator(semanticsLabel: "Loading...",),
              )
            : GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: googleMapModel.currentLocation.latLong, zoom: 15),
                mapType: MapType.normal,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                markers: googleMapModel.markerMap.values.toSet(),
                circles: googleMapModel.circleSet,
                polylines: googleMapModel.polylineSet,
                zoomControlsEnabled: false,
                onMapCreated: (GoogleMapController controller) {
                  googleMapModel.mapController = controller;
                },
              );
      },
    );
  }
}

/*
  _createCustomMarker() async {
    if (taxiIcon == null) {
      var customIcon = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(), ImageConstants.TAXI_MARKER);
      setState(() {
        taxiIcon = customIcon;
      });
    }
  }

  _getMarkers() {
    return [
      Marker(
          position: ProjectConstants.CURRENT_LOCATION,
          markerId: MarkerId("me"),
          infoWindow: InfoWindow(title: "Current Location"),
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueOrange)),
      Marker(
          position: LatLng(39.752931, 30.4859343),
          markerId: MarkerId("taxi"),
          infoWindow: InfoWindow(title: "Taxi"),
          icon: taxiIcon ?? BitmapDescriptor.defaultMarker)
    ].toSet();
  }
 */
