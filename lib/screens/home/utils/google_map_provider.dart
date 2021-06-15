import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:piton_taxi_app/core/constants/enums/payments.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'dart:async';
import 'package:piton_taxi_app/core/init/navigation/pages_import.dart';
import 'package:piton_taxi_app/screens/search_location/model/place_model.dart';
import 'package:piton_taxi_app/screens/home/service/google_api_repository.dart';
import 'package:piton_taxi_app/screens/home/service/locator.dart';
import 'package:piton_taxi_app/screens/search_location/model/location_model.dart';
import 'package:piton_taxi_app/screens/home/model/direction_model.dart';
import 'package:piton_taxi_app/core/constants/enums/trip_status.dart';

class GoogleMapProvider extends ChangeNotifier {
  GoogleMapRepository _repository = locator<GoogleMapRepository>();

  GoogleMapController mapController; // Google Maps controller

  LocationModel currentLocation; // Keeps the current location information
  LocationModel
      initialLocation; // Keeps the starting location information of the trip
  LocationModel
      destinationLocation; // Keeps the destination location information of the trip

  List<PlaceModel> placePredictions =
      []; // Keeps predictions from API for autocomplete

  DirectionModel tripDirectionModel;
  DirectionModel driverDirectionModel;

  TextEditingController initialLocationController = TextEditingController();
  TextEditingController destinationLocationController =
      TextEditingController();

  Map<MarkerId, Marker> markerMap =
      Map<MarkerId, Marker>(); // Keeps markers and marker ids
  Set<Polyline> polylineSet = {}; //Keeps polyline
  Set<Circle> circleSet = {};

  PermissionStatus
      permissionStatus; // Intermediary class that performs API operations
  TripStatus
      tripStatus; // Enum variable that controls the states of the journey
  Payments
      paymentStatus; // Enum variable that controls the states of the payment

  List<LatLng> tripLatLng;
  List<LatLng> driverLatLng;

  BitmapDescriptor taxiIcon;
  BitmapDescriptor generalIcon;

  GoogleMapProvider() {
    checkLocationPermission();
    dummyDuration = 0;
    changeTripStatus(TripStatus.BEFORE_TRIP);
    _createCustomMarker();
  }

  clearCurrentLocation() {
    if (currentLocation != null) currentLocation = null;
  }

  // It is checked whether the user gives location permission in Runtime.
  // If permission is denied, the user is directed to the settings page.
  void checkLocationPermission() async {
    permissionStatus = await Permission.location.status;
    if (permissionStatus.isPermanentlyDenied) {
      openAppSettings();
      exit(0);
    } else if (permissionStatus.isDenied) {
      permissionStatus = await Permission.location.request();
      if (!permissionStatus.isGranted) {
        bool settingsOpened = await openAppSettings();
        // The life cycle stops when you leave the application and go to the settings page.
        // Therefore, when you return to the application by handling this situation,
        // the permissions are checked again as a result of the changes made in the settings.
        if (settingsOpened) {
          BasicMessageChannel<String> lifecycleChannel =
              SystemChannels.lifecycle;
          lifecycleChannel.setMessageHandler((msg) async {
            // When the app is resumed, we'll stop listening to lifecycle changes
            if (msg.contains("resumed")) {
              lifecycleChannel.setMessageHandler(null);
              checkLocationPermission();
            }
            return msg.toString();
          });
        }
      } else if (permissionStatus.isGranted) _setCurrentToInitial();
    } else if (permissionStatus.isGranted) _setCurrentToInitial();
    notifyListeners();
  }

  _setCurrentToInitial() async {
    setInitialLocation(await fetchCurrentLocation());
  }

  changeTripStatus(TripStatus newStatus) {
    tripStatus = newStatus;
    notifyListeners();
  }

  changePaymentStatus(Payments newStatus) {
    paymentStatus = newStatus;
    notifyListeners();
  }

  addPolyline(Polyline polyline) {
    polylineSet.add(polyline);
    notifyListeners();
  }

  addMarker(Marker marker, MarkerId markerId) {
    markerMap[markerId] = marker;
    notifyListeners();
  }

  addCircle(Circle circle) {
    circleSet.add(circle);
    notifyListeners();
  }

  clearPolylineSet() {
    if (polylineSet.isNotEmpty) polylineSet.clear();
    notifyListeners();
  }

  clearMarkers() {
    if (markerMap.isNotEmpty) markerMap = {};
    notifyListeners();
  }

  clearCircles() {
    if (circleSet.isNotEmpty) circleSet.clear();
    notifyListeners();
  }

  clearInitialLocation() {
    initialLocation = currentLocation;
  }

  clearDestinationLocation() {
    if (destinationLocation != null) destinationLocation = null;
  }

  clearPlacePredictions() {
    placePredictions.clear();
    notifyListeners();
  }

  clearAll() {
    changeTripStatus(TripStatus.BEFORE_TRIP);
    clearCircles();
    clearMarkers();
    clearPolylineSet();
    clearPlacePredictions();
    clearInitialLocation();
    clearDestinationLocation();
    changePaymentStatus(Payments.DONE);
    animateCameraNewLatLng(currentLocation);
    if (driverLatLng != null) driverLatLng.clear();
    if (tripLatLng != null) tripLatLng.clear();
  }

  /// Captures the instant position and returns it to the location model and stores it in currentLocation
  fetchCurrentLocation() async {
    Position currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    currentLocation = await _repository.getPlaceFromAddress(
        "${currentPosition.latitude},${currentPosition.longitude}");
    if (currentLocation == null)
      currentLocation =
          await _repository.getPlaceFromAddress("39.9030394,32.4825798");
    notifyListeners();
    return currentLocation;
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

  /// Retrieves the details of the user's chosen address from the API
  Future<LocationModel> getPlaceDetail(String placeID) async {
    return await _repository.getPlaceDetail(placeID);
  }

  /// Calls the function that request the direction by sending the trip initial and destination locations
  getTripDirection() async {
    changeTripStatus(TripStatus.AFTER_DRAWING_TRIP_ROUTE);
    await getDirection(initialLocation, destinationLocation);
  }

  /// Makes a request to the API to get Direction information and calls the method that draws the route with this returning response
  getDirection(LocationModel initial, LocationModel destination) async {
    DirectionModel directionModel =
        await _repository.apiService.getDirection(initial, destination);

    tripStatus == TripStatus.TAXI_COMING
        ? driverDirectionModel = directionModel
        : tripDirectionModel = directionModel;

    drawPolyline(directionModel.encodedPoints);
    notifyListeners();
  }

  /// Decode the points in encoded points taken from the direction details to take their latitudes and longitudes
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

    tripStatus == TripStatus.AFTER_DRAWING_TRIP_ROUTE
        ? tripLatLng = polylineCoordinates
        : driverLatLng = polylineCoordinates;

    Polyline polyline = createPolyline(polylineCoordinates);

    addPolyline(polyline);
    addInitialDestinationMarkersAndCircles();
    applyLatLngBounds();
  }

  // Creates and returns polyline
  Polyline createPolyline(List<LatLng> polylineCoordinates) {
    return Polyline(
      color:
          tripStatus == TripStatus.TAXI_COMING ? Colors.yellow : Colors.amber,
      polylineId: tripStatus == TripStatus.TAXI_COMING
          ? PolylineId("Taxi")
          : PolylineId("Trip"),
      jointType: JointType.round,
      points: polylineCoordinates,
      width: 5,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      geodesic: true,
    );
  }

  // Sets borders by selecting the closest positions from 4 sides to the initial and
  // destination locations to find the closest route while drawing the polyline
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

    if (tripStatus == TripStatus.AFTER_DRAWING_TRIP_ROUTE)
      mapController
          .animateCamera(CameraUpdate.newLatLngBounds(latLngBounds, 70));
  }

  // Adds markers and circles to initial and destination locations
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

  // Creates and returns marker
  Marker createMarker(MarkerId id, LocationModel location) {
    return Marker(
        markerId: id,
        position: location.latLong,
        infoWindow: InfoWindow(title: location.name),
        icon: generalIcon);
  }

  // Creates and returns circle
  Circle createCircle(LocationModel location) {
    return Circle(
        fillColor: Colors.amberAccent.shade100,
        center: location.latLong,
        radius: 10,
        strokeColor: Colors.amberAccent.shade100,
        strokeWidth: 4,
        circleId: CircleId(location.name));
  }

  // Creates custom markers to be used in the application
  _createCustomMarker() async {
    if (taxiIcon == null) {
      var customIcon = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(), ImageConstants.TAXI_MARKER);
      taxiIcon = customIcon;
    }
    if (generalIcon == null) {
      var customIcon = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(), ImageConstants.GENERAL_MARKER);
      generalIcon = customIcon;
    }
  }

  double dummyDuration;

  // This method is written as a dummy
  tripStarted() async {
    LocationModel driverModel =
        LocationModel("Driver", "Driver", 39.774279, 30.512047);
    await getDirection(driverModel, initialLocation);
    var index1 = 0;
    var index2 = 0;
    dummyDuration = (driverDirectionModel.duration % 3600) / 60;
    var factor = dummyDuration / driverLatLng.length;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (tripStatus == TripStatus.TAXI_COMING || tripStatus == TripStatus.TRIP_STARTED) {
        if (index1 < driverLatLng.length) {
          addMarker(
              Marker(
                  markerId: MarkerId("Taxi"),
                  position: driverLatLng[index1],
                  icon: taxiIcon,
                  flat: true,
                  anchor: Offset(0.5, 0.5)),
              MarkerId("Taxi"));
          animateCameraNewLatLng(LocationModel("Taxi", "Taxi",
              driverLatLng[index1].latitude, driverLatLng[index1].longitude));
          index1 += 1;
          dummyDuration -= factor;
        } else {
          if (index2 == 0) changeTripStatus(TripStatus.TRIP_STARTED);
          if (index2 < tripLatLng.length) {
            addMarker(
                Marker(
                    markerId: MarkerId("Taxi"),
                    position: tripLatLng[index2],
                    icon: taxiIcon,
                    flat: true,
                    anchor: Offset(0.5, 0.5)),
                MarkerId("Taxi"));
            animateCameraNewLatLng(LocationModel("Taxi", "Taxi",
                tripLatLng[index2].latitude, tripLatLng[index2].longitude));
            index2 += 1;
          } else {
            changeTripStatus(TripStatus.TRIP_END);
            timer.cancel();
          }
        }
      } else {
        timer.cancel();
      }
    });
    index1 = 0;
    index2 = 0;
  }
}
