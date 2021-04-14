import 'driver_model.dart';

class Trip{
  int tripID;
  String startLocation;
  String endLocation;
  String date;
  String startTime;
  String endTime;
  String tripStatus;
  double distance;
  int time;
  double price;
  Driver driver;
  int rating;
  String comments;

  Trip({this.startLocation, this.endLocation, this.date, this.startTime, this.endTime, this.tripStatus, this.distance, this.time, this.price, this.driver, this.rating, this.comments});

  @override
  String toString() {
    return 'Trip{tripID: $tripID, startLocation: $startLocation, endLocation: $endLocation, date: $date, startTime: $startTime, endTime: $endTime, tripStatus: $tripStatus, distance: $distance, time: $time, price: $price, driver: $driver, rating: $rating, comments: $comments}';
  }
}