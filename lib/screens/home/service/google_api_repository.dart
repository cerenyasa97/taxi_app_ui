import 'package:piton_taxi_app/screens/search_location/model/location_model.dart';
import 'package:piton_taxi_app/screens/search_location/model/place_model.dart';
import 'package:piton_taxi_app/screens/home/service/google_api_service.dart';
import 'package:piton_taxi_app/screens/home/model/direction_model.dart';
import 'package:piton_taxi_app/screens/home/service/locator.dart';

class GoogleMapRepository{
  GoogleApiService apiService = locator<GoogleApiService>();

  /// Returns a list containing data of type PlaceModel from the API Service
  /// PlaceModel objects holds mainText, secondaryText, placeID and types variables
  Future<List<PlaceModel>> autocomplete(String enteredPlace) async {
    return await apiService.autocomplete(enteredPlace);
  }

  /// Returns the LocationModel type from the API Service,
  /// LocationModel object holds the location ID, name, latitude and longitude variables
  Future<LocationModel> getPlaceDetail(String placeID) async {
    return await apiService.getPlaceDetail(placeID);
  }

  /// Returns the DirectionModel object from API Service
  /// DirectionModel object holds values for polyline points, distance and travel time between two locations variables
  Future<DirectionModel> getDirection(LocationModel initialLocation, LocationModel destinationLocation) async {
    return await apiService.getDirection(initialLocation, destinationLocation);
  }

  Future<LocationModel> getPlaceFromAddress(String address) async {
    return await apiService.getPlaceFromAddress(address);
  }
}