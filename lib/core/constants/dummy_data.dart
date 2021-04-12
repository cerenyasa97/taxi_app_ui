import 'package:piton_taxi_app/screens/payment/model/credit_card_model.dart';
import 'package:piton_taxi_app/screens/profile/model/user_model.dart';

class DummyData{
  static User user_1 = User(nameSurname: "John Doe", email: "johndoe@hotmail.com", phoneNumber: "+90 555 415 62 54");
  static String TOTAL_POINTS = "10,000";

  static const String CARD_NUMBER = "XXXX XXXX XXXX XXXX";
  static const String CARD_EXPIRATION_DATE = "XX/XX";
  static const String CVC = "XXX";
  static final CreditCard card1 = CreditCard(user_1.nameSurname, CARD_NUMBER, CARD_EXPIRATION_DATE, CVC);
  static final List<CreditCard> cardList = [card1];
}