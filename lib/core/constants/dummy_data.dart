import 'package:piton_taxi_app/screens/payment/model/credit_card_model.dart';

class DummyData{
  static const String NAME_SURNAME = "John Doe";
  static const String PHONE = "+90 555 415 62 54";
  static const String EMAIL = "johndoe@hotmail.com";
  static const String TOTAL_POINTS = "10,000";

  static const String CARD_NUMBER = "XXXX XXXX XXXX XXXX";
  static const String CARD_EXPIRATION_DATE = "XX/XX";
  static const String CVC = "XXX";
  static final CreditCard card1 = CreditCard(NAME_SURNAME, CARD_NUMBER, CARD_EXPIRATION_DATE, CVC);
  static final List<CreditCard> cardList = [card1];
}