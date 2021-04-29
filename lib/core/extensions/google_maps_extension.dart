import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

extension GoogleMapExtension on BuildContext {
  MapType normalToSatellite(MapType currentType) =>
      currentType == MapType.normal ? MapType.satellite : MapType.normal;
}