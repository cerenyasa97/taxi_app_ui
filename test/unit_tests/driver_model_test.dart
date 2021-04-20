import 'package:flutter_test/flutter_test.dart';
import 'package:piton_taxi_app/screens/trips/model/driver_model.dart';


void main() {
  test('Is driver empty or not', () {
    final Driver driver = Driver("Jack Doe", "+92 541 542 65 41");

    expect(driver.nameSurname, "Jack Doe");
    expect(driver.phoneNumber, "+92 541 542 65 41");
  });
}