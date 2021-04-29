class Driver{
  String nameSurname;
  String phoneNumber;
  String licensePlate;

  Driver(this.nameSurname, this.phoneNumber, this.licensePlate);

  @override
  String toString() {
    return 'Driver{nameSurname: $nameSurname, phoneNumber: $phoneNumber, licensePlate: $licensePlate}';
  }
}