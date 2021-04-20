import 'package:flutter_test/flutter_test.dart';
import 'package:piton_taxi_app/screens/payment/model/credit_card_model.dart';

void main() {
  test('Is credit card empty or not', () {
    final CreditCard creditCard = CreditCard("John Doe", "6562 5124 2136 9857", "11/23", "540");

    expect(creditCard.cardHolder, "John Doe");
    expect(creditCard.cardNumber, "6562 5124 2136 9857");
    expect(creditCard.expirationDate, "11/23");
    expect(creditCard.cvc, "540");
  });
}