class User{
  int userID;
  String nameSurname;
  String email;
  String phoneNumber;
  String homeAddress;
  String workAddress;
  Map<String,String> anotherAddresses = Map<String, String>();   //Yeni adres eklendiğinde adres keyi ve adres bilgisini tutan Map

  User({this.nameSurname, this.email, this.phoneNumber, this.homeAddress, this.workAddress});

  addAnotherAddress(String label, String address) => anotherAddresses[label] = address;

  @override
  String toString() {
    return 'User{nameSurname: $nameSurname, email: $email, phoneNumber: $phoneNumber}';
  }
}