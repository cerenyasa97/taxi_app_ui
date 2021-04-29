import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationModel{
  String placeID;
  String name;
  double latitude;
  double longitude;

  LocationModel(this.placeID, this.name, this.latitude, this.longitude);

  @override
  String toString() {
    return 'LocationModel{placeID: $placeID, name: $name, latitude: $latitude, longitude: $longitude}';
  }
}

extension LatLongExtension on LocationModel{
  LatLng get latLong => LatLng(this.latitude, this.longitude);
}