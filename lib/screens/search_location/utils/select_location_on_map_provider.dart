import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:piton_taxi_app/core/init/pages_import.dart';
import 'package:piton_taxi_app/screens/home/service/google_api_repository.dart';
import 'package:piton_taxi_app/screens/home/service/locator.dart';

class SelectLocationOnMapProvider extends ChangeNotifier{
  GoogleMapRepository _repository = locator<GoogleMapRepository>();

  fetchLocationOnTap(LatLng location) async {
    return await _repository.getPlaceFromAddress("${location.latitude},${location.longitude}");
  }
}