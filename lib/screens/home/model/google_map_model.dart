import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:piton_taxi_app/core/init/pages_import.dart';
import 'package:piton_taxi_app/screens/search_location/model/place_model.dart';
import 'package:piton_taxi_app/screens/home/service/google_api_repository.dart';
import 'package:piton_taxi_app/screens/home/service/locator.dart';
import 'package:piton_taxi_app/screens/search_location/model/location_model.dart';
import 'package:piton_taxi_app/screens/home/model/direction_model.dart';

class GoogleMapModel extends ChangeNotifier {
  GoogleMapRepository _repository = locator<
      GoogleMapRepository>(); // Intermediary class that performs API operations

  GoogleMapController mapController; // Google Maps controller

  LocationModel currentLocation; // Keeps the current location information
  LocationModel
      initialLocation; // Keeps the starting location information of the trip
  LocationModel
      destinationLocation; // Keeps the destination location information of the trip

  List<PlaceModel> placePredictions =
      []; // Keeps predictions from API for autocomplete

  DirectionModel directionModel;

  Map<MarkerId, Marker> markerMap =
      Map<MarkerId, Marker>(); // Keeps markers and marker ids
  Set<Polyline> polylineSet = {}; //Keeps polyline
  Set<Circle> circleSet = {};

  GoogleMapModel() {
    fetchCurrentLocation();
  }

  addPolyline(Polyline polyline) {
    polylineSet.add(polyline);
    notifyListeners();
  }

  clearPolylineSet() {
    polylineSet.clear();
    notifyListeners();
  }

  addMarker(Marker marker, MarkerId markerId) {
    markerMap[markerId] = marker;
    notifyListeners();
  }

  clearMarkers() {
    markerMap = {};
    notifyListeners();
  }

  addCircle(Circle circle) {
    circleSet.add(circle);
    notifyListeners();
  }

  clearCircles(){
    circleSet.clear();
    notifyListeners();
  }

  clearAll(){
    clearCircles();
    clearMarkers();
    clearPolylineSet();
  }

  /// Captures the instant position and returns it to the location model and stores it in currentLocation
  fetchCurrentLocation() async {
    Position currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    currentLocation = LocationModel("CurrentLocation", "Current Location",
        currentPosition.latitude, currentPosition.longitude);
    initialLocation = currentLocation;
    notifyListeners();
  }

  /// Takes a parameter of the LocationModel type and assigns this parameter to the initialLocation
  setInitialLocation(LocationModel location) {
    initialLocation = location;
    notifyListeners();
  }

  /// Takes a parameter of the LocationModel type and assigns this parameter to the destinationLocation
  setDestinationLocation(LocationModel location) {
    destinationLocation = location;
    notifyListeners();
  }

  /// Converts the camera position to the location of the LocationModel that it takes as a parameter
  animateCameraNewLatLng(LocationModel model) {
    mapController.animateCamera(CameraUpdate.newLatLng(model.latLong));
  }

  /// Gets predictions from the API for the address the user will enter
  autocompleteAddress(String enteredPlace) async {
    placePredictions = await _repository.autocomplete(enteredPlace);
    notifyListeners();
  }

  clearPlacePredictions() {
    placePredictions.clear();
    notifyListeners();
  }

  /// Retrieves the details of the user's chosen address from the API
  Future<LocationModel> getPlaceDetail(String placeID) async {
    return await _repository.getPlaceDetail(placeID);
  }

  /// Makes a request to the API to get Direction information and calls the method that draws the route with this returning response
  Future<DirectionModel> getDirection() async {
    directionModel = await _repository.apiService
        .getDirection(initialLocation, destinationLocation);
    drawPolyline(directionModel.encodedPoints);
    notifyListeners();
  }

  /// Solves the points in encoded points taken from the direction details to take their latitudes and longitudes
  /// Creates polyline with this location list
  drawPolyline(String encodedPoints) {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> decodedPolylinePoints =
        polylinePoints.decodePolyline(encodedPoints);
    if (decodedPolylinePoints.isNotEmpty) {
      decodedPolylinePoints.forEach((pointLatLng) {
        polylineCoordinates
            .add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
      });
    }

    clearPolylineSet();

    Polyline polyline = createPolyline(polylineCoordinates);

    addPolyline(polyline);
    addInitialDestinationMarkersAndCircles();
    applyLatLngBounds();
  }

  Polyline createPolyline(List<LatLng> polylineCoordinates) {
    return Polyline(
      color: Colors.amber,
      polylineId: PolylineId("PolylineId"),
      jointType: JointType.round,
      points: polylineCoordinates,
      width: 5,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      geodesic: true,
    );
  }

  applyLatLngBounds() {
    LatLngBounds latLngBounds;
    if (currentLocation.latitude > destinationLocation.latitude &&
        currentLocation.longitude > destinationLocation.longitude) {
      latLngBounds = LatLngBounds(
          southwest: destinationLocation.latLong,
          northeast: currentLocation.latLong);
    } else if (currentLocation.latitude > destinationLocation.latitude) {
      latLngBounds = LatLngBounds(
          southwest:
              LatLng(destinationLocation.latitude, currentLocation.longitude),
          northeast:
              LatLng(currentLocation.latitude, destinationLocation.longitude));
    } else if (currentLocation.longitude > destinationLocation.longitude) {
      latLngBounds = LatLngBounds(
          southwest:
              LatLng(currentLocation.latitude, destinationLocation.longitude),
          northeast:
              LatLng(destinationLocation.latitude, currentLocation.longitude));
    } else {
      latLngBounds = LatLngBounds(
          southwest: currentLocation.latLong,
          northeast: destinationLocation.latLong);
    }

    mapController.animateCamera(CameraUpdate.newLatLngBounds(latLngBounds, 50));
  }

  addInitialDestinationMarkersAndCircles() {
    clearMarkers();
    clearCircles();
    MarkerId initialID = MarkerId("Initial Location");
    addMarker(createMarker(initialID, initialLocation), initialID);
    addCircle(createCircle(initialLocation));
    MarkerId destinationID = MarkerId("Destination Location");
    addMarker(createMarker(destinationID, destinationLocation), destinationID);
    addCircle(createCircle(destinationLocation));
  }

  Marker createMarker(MarkerId id, LocationModel location) {
    return Marker(
      markerId: id,
      position: location.latLong,
      infoWindow: InfoWindow(title: location.name),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet)
    );
  }

  Circle createCircle(LocationModel location){
    return Circle(
      fillColor: Colors.amberAccent.shade100,
      center: location.latLong,
      radius: 10,
      strokeColor: Colors.amberAccent.shade100,
      strokeWidth: 4,
      circleId: CircleId(location.name)
    );
  }
}
