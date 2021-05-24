import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/screens/search_location/model/location_model.dart';
import 'package:piton_taxi_app/screens/home/utils/google_map_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:piton_taxi_app/widgets/progress_indicator/custom_progress_indicator.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoogleMapBackground extends StatefulWidget {
  @override
  _GoogleMapBackgroundState createState() => _GoogleMapBackgroundState();
}

class _GoogleMapBackgroundState extends State<GoogleMapBackground> {

  String _mapStyle;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      setMapStyle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GoogleMapProvider>(
      builder: (context, googleMapModel, child) {
        return googleMapModel.currentLocation != null// && googleMapModel.status.isGranted
            ? GoogleMap(
          initialCameraPosition: CameraPosition(
              target: googleMapModel.currentLocation.latLong, zoom: 15),
          //mapType: MapType.normal,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          markers: googleMapModel.markerMap.values.toSet(),
          circles: googleMapModel.circleSet,
          polylines: googleMapModel.polylineSet,
          onMapCreated: (GoogleMapController controller) {
            googleMapModel.mapController = controller;
            googleMapModel.mapController.setMapStyle(_mapStyle);
          },
        ) : Center(
                child: CustomProgressIndicator(),
              );
      },
    );
  }

  setMapStyle() {
    rootBundle.loadString(TextConstants.MAP_STYLE_PATH).then((value) => _mapStyle = value);
  }
}
/*
GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: googleMapModel.currentLocation.latLong, zoom: 15),
                //mapType: MapType.normal,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                markers: googleMapModel.markerMap.values.toSet(),
                circles: googleMapModel.circleSet,
                polylines: googleMapModel.polylineSet,
                onMapCreated: (GoogleMapController controller) {
                  googleMapModel.mapController = controller;
                  googleMapModel.mapController.setMapStyle(_mapStyle);
                },
              );
 */