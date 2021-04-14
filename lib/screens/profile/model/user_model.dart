class User{
  int userID;
  String nameSurname;
  String email;
  String phoneNumber;

  User({this.nameSurname, this.email, this.phoneNumber});

  @override
  String toString() {
    return 'User{nameSurname: $nameSurname, email: $email, phoneNumber: $phoneNumber}';
  }
}