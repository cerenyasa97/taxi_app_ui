import 'package:piton_taxi_app/screens/search_location/model/location_model.dart';

class User{
  int userID;
  String nameSurname;
  String email;
  String phoneNumber;
  LocationModel homeAddress;
  LocationModel workAddress;
  Map<String, LocationModel> anotherAddresses = Map<String, LocationModel>();   //Yeni adres eklendiğinde adres keyi ve adres bilgisini tutan Map

  User({this.nameSurname, this.email, this.phoneNumber, this.homeAddress, this.workAddress});

  addAnotherAddress(String label, LocationModel address) => anotherAddresses[label] = address;

  @override
  String toString() {
    return 'User{nameSurname: $nameSurname, email: $email, phoneNumber: $phoneNumber}';
  }
}