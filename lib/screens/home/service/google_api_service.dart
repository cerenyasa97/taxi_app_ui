import 'package:piton_taxi_app/screens/search_location/model/location_model.dart';
import 'package:piton_taxi_app/screens/search_location/model/place_model.dart';
import 'package:piton_taxi_app/core/constants/credentials/api_key.dart';
import 'package:piton_taxi_app/screens/home/model/direction_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GoogleApiService {
  Future<dynamic> _getRequest(String url) async {
    http.Response response = await http.get(Uri.parse(url));

    switch (response.statusCode) {
      case 200:
        String jsonData = response.body;
        var decodeData = jsonDecode(jsonData);
        return decodeData;
        break;
      default:
        return "Error occurred during api connection";
    }
  }

  /// Makes an API query for AutoComplete, returns the response in the PlaceModel data type
  /// Returns a list with data of the PlaceModel type, objects have variables mainText, secondaryText, placeID and types
  // ignore: missing_return
  Future<List<PlaceModel>> autocomplete(String text) async {
    if (text.length > 1) {
      final String autoCompleteUrl =
          "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$text&key=$GOOGLE_MAPS_API_KEY&sessiontoken=1234567890&components=country:tr&language=tr";
      final result = await _getRequest(autoCompleteUrl);
      return (result["predictions"] as List)
          .map((e) => PlaceModel.fromJson(e))
          .toList();
    }
  }

  /// Returns address details in response, using the placeID of the address received with autocomplete
  /// The returned object is of type LocationModel, holds the values of placeId, name, latitude and longitude
  Future<LocationModel> getPlaceDetail(String placeID) async {
    final String placeAddressDetailsUrl =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeID&key=$GOOGLE_MAPS_API_KEY&language=tr";
    final result = await _getRequest(placeAddressDetailsUrl);
    final location = result["result"]["geometry"]["location"];
    return LocationModel(
        placeID, result["result"]["name"], location["lat"], location["lng"]);
  }

  /// Takes the initial and destination model​of the trip as parameters
  /// Returns DirectionModel object holds the values of polyline points, distance and trip duration values​between two locations
  Future<DirectionModel> getDirection(
      LocationModel initialLocation, LocationModel destinationLocation) async {
    final String directionsUrl =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${initialLocation.latitude},${initialLocation.longitude}&destination=${destinationLocation.latitude},${destinationLocation.longitude}&key=$GOOGLE_MAPS_API_KEY&language=tr";
    var result = await _getRequest(directionsUrl);
    final distanceText = result["routes"][0]["legs"][0]["distance"]["text"];
    final durationText = result["routes"][0]["legs"][0]["duration"]["text"];
    final encodedPoints = result["routes"][0]["overview_polyline"]["points"];
    final distance = result["routes"][0]["legs"][0]["distance"]["value"];
    final duration = result["routes"][0]["legs"][0]["duration"]["value"];
    return DirectionModel(distanceText, durationText, encodedPoints, distance, duration);
  }

  Future<LocationModel> getPlaceFromAddress(String address) async {
    final String placeUrl = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=$address&key=$GOOGLE_MAPS_API_KEY&language=tr";
    final result = await _getRequest(placeUrl);
    return await getPlaceDetail(result["results"][0]["place_id"]);
  }
}
