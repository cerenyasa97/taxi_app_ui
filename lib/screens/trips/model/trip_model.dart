import 'driver_model.dart';
import 'package:piton_taxi_app/screens/search_location/model/location_model.dart';
import 'package:piton_taxi_app/core/constants/enums/payments.dart';

class Trip{
  LocationModel initialLocation;
  LocationModel destinationLocation;
  String distance;
  String duration;
  String price;
  Payments payments;
  Driver driver;

  Trip(this.initialLocation, this.destinationLocation, this.distance,
      this.duration, this.price, this.payments, this.driver);
}