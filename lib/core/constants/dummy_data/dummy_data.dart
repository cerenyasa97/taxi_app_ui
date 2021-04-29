import 'package:piton_taxi_app/screens/notifications/model/notification_model.dart';
import 'package:piton_taxi_app/screens/payment/model/credit_card_model.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/screens/trips/model/trip_status_enum.dart';
import 'package:piton_taxi_app/screens/profile/model/user_model.dart';
import 'package:piton_taxi_app/screens/trips/model/driver_model.dart';
import 'package:piton_taxi_app/screens/trips/model/trip_model.dart';

class DummyData {
  static User user_1 = User(
      nameSurname: "John Doe",
      email: "johndoe@hotmail.com",
      phoneNumber: "+90 555 415 62 54",
  );
  static const String TOTAL_POINTS = "10,000";

  static const String CARD_NUMBER = "XXXXXXXXXXXXXXXX";
  static const String CARD_EXPIRATION_DATE = "XX/XX";
  static final CreditCard card1 =
      CreditCard(user_1.nameSurname, CARD_NUMBER, CARD_EXPIRATION_DATE);
  static final List<CreditCard> cardList = [card1];

  static Trip oncomingTrip = Trip(
      startLocation: "Piton Ar-Ge and Software House",
      endLocation: "İsmet İnönü 1 Avenue",
      date: "16 April 2021",
      startTime: "18:14",
      endTime: "18:36",
      tripStatus: getStatus(TripStatus.ONCOMING),
      distance: 7.2,
      time: 17,
      price: 34,
      driver: Driver("Jack Doe", "+90 545 545 54 54", "26 XXX 216"),
      rating: 5);
  static Trip compLetedTrip = Trip(
      startLocation: "İsmet İnönü 1 Avenue",
      endLocation: "Odunpazarı Modern Museum",
      date: "12 April 2021",
      startTime: "18:20",
      endTime: "18:45",
      tripStatus: getStatus(TripStatus.COMPLETED),
      distance: 3.3,
      time: 10,
      price: 19,
      driver: Driver("Jack Doe", "+90 545 545 54 54", "26 XXX 216"),
      rating: 3);
  static Trip cancelledTrip = Trip(
      startLocation: "Opera",
      endLocation: "Home",
      date: "09 January 2021",
      startTime: "10:15",
      endTime: "11:00",
      tripStatus: getStatus(TripStatus.CANCELLED),
      distance: 1.9,
      time: 4,
      price: 15,
      driver: Driver("Jack Doe", "+90 545 545 54 54", "26 XXX 216"),
      rating: 4);
  static List<Trip> oncoming = [oncomingTrip];
  static List<Trip> completed = [compLetedTrip];
  static List<Trip> cancelled = [cancelledTrip];

  static List<String> offersList = [
    ImageConstants.OFFER_1,
    ImageConstants.OFFER_1,
    ImageConstants.OFFER_1,
  ];

  static List<NotificationModel> notificationList = [
    NotificationModel("Your next trip is oncoming", NotificationType.oncoming),
    NotificationModel("Have a message from driver", NotificationType.message),
    NotificationModel("Your next trip was completed", NotificationType.completed),
    NotificationModel("Your next trip was cancelled", NotificationType.cancelled),
    NotificationModel("Your next trip information", NotificationType.information),
  ];
}
