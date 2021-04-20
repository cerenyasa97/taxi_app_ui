import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:piton_taxi_app/screens/profile/model/user_model.dart';

void main() {

  final User user = User(
      nameSurname: "John Doe",
      email: "johndoe@hotmail.com",
      phoneNumber: "+92 545 454 21 21",
      homeAddress: "Kartal Mah.",
      workAddress: "Kartal Mah.");

  test('Is user empty or not', () {
    expect(user.nameSurname, "John Doe");
    expect(user.email, "johndoe@hotmail.com");
    expect(user.phoneNumber, "+92 545 454 21 21");
    expect(user.homeAddress, "Kartal Mah.");
    expect(user.workAddress, "Kartal Mah.");
  });

  test("Is adding a new address in another addresses map", () {
    user.addAnotherAddress("School", "Büyükdere Mah.");
    expect(user.anotherAddresses.isNotEmpty, true);
    expect(user.anotherAddresses.length, 1);
  }
  );
}
