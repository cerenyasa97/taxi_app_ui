import 'package:flutter_test/flutter_test.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/screens/trips/model/driver_model.dart';


void main() {
  test('Is driver empty or not', () {
    final Driver driver = Driver("Jack Doe", "+92 541 542 65 41", "26 XXX 451", ImageConstants.DRIVER_IMAGE, "3.5");

    expect(driver.nameSurname, "Jack Doe");
    expect(driver.phoneNumber, "+92 541 542 65 41");
  });
}