import 'package:piton_taxi_app/screens/home/service/google_api_repository.dart';
import 'package:piton_taxi_app/screens/home/service/locator.dart';
import 'package:piton_taxi_app/screens/search_location/model/location_model.dart';

class SearchAddressService{
  GoogleMapRepository _repository = locator<GoogleMapRepository>();

  Future<LocationModel> getLocationFromAddress(String address) async {
    return await _repository.getPlaceFromAddress(address);
  }
}