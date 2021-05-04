import 'package:piton_taxi_app/core/init/pages_import.dart';
import 'package:piton_taxi_app/screens/search_location/model/location_model.dart';
import 'package:piton_taxi_app/screens/trips/model/driver_model.dart';
import 'package:piton_taxi_app/screens/trips/model/trip_model.dart';
import 'package:piton_taxi_app/core/constants/enums/payments.dart';

class TripProvider extends ChangeNotifier{
  static Trip trip;

  setInitialLocation(LocationModel locationModel){
    trip.initialLocation = locationModel;
    notifyListeners();
  }

  setDestinationLocation(LocationModel locationModel){
    trip.destinationLocation = locationModel;
    notifyListeners();
  }

  setPaymentType(Payments payment){
    trip.payments = payment;
    notifyListeners();
  }

  setDistance(String distance){
    trip.distance = distance;
    notifyListeners();
  }

  setDuration(String duration){
    trip.duration = duration;
    notifyListeners();
  }

  setDriver(Driver driver){
    trip.driver = driver;
    notifyListeners();
  }
}