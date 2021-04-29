import 'package:flutter_test/flutter_test.dart';
import 'package:piton_taxi_app/screens/trips/model/trip_model.dart';
import 'package:piton_taxi_app/screens/trips/model/trip_status_enum.dart';
import 'package:piton_taxi_app/screens/trips/model/driver_model.dart';


void main() {
  test('Is trip empty or not', () {
    final Trip trip = Trip(
        startLocation: "Piton Ar-Ge and Software House",
        endLocation: "İsmet İnönü 1 Avenue",
        date: "16 April 2021",
        startTime: "18:14",
        endTime: "18:36",
        tripStatus: getStatus(TripStatus.ONCOMING),
        distance: 7.2,
        time: 17,
        price: 34,
        driver: Driver("Jack Doe", "+90 545 545 54 54", "26 XX 545"),
        rating: 5);

    expect(trip.startLocation, "Piton Ar-Ge and Software House");
    expect(trip.endLocation, "İsmet İnönü 1 Avenue");
    expect(trip.tripStatus, getStatus(TripStatus.ONCOMING));
    expect(trip.distance, 7.2);
  });
}