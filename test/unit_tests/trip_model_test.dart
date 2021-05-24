import 'package:flutter_test/flutter_test.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/screens/trips/model/dummy_trip_model.dart';
import 'package:piton_taxi_app/core/constants/enums/trips.dart';
import 'package:piton_taxi_app/screens/trips/model/driver_model.dart';


void main() {
  test('Is trip empty or not', () {
    final DummyTrip trip = DummyTrip(
        startLocation: "Piton Ar-Ge and Software House",
        endLocation: "İsmet İnönü 1 Avenue",
        date: "16 April 2021",
        startTime: "18:14",
        endTime: "18:36",
        tripStatus: getStatus(Trips.ONCOMING),
        distance: 7.2,
        time: 17,
        price: 34,
        driver: Driver("Jack Doe", "+90 545 545 54 54", "26 XX 545", ImageConstants.DRIVER_IMAGE, "3.5"),
        rating: 5);

    expect(trip.startLocation, "Piton Ar-Ge and Software House");
    expect(trip.endLocation, "İsmet İnönü 1 Avenue");
    expect(trip.tripStatus, getStatus(Trips.ONCOMING));
    expect(trip.distance, 7.2);
  });
}