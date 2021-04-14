class Driver{
  String nameSurname;
  String phoneNumber;

  Driver(this.nameSurname, this.phoneNumber);

  @override
  String toString() {
    return 'Driver{nameSurname: $nameSurname, phoneNumber: $phoneNumber}';
  }
}