class Driver{
  String imagePath;
  String nameSurname;
  String phoneNumber;
  String licensePlate;
  String rating;

  Driver(this.nameSurname, this.phoneNumber, this.licensePlate, this.imagePath, this.rating);

  @override
  String toString() {
    return 'Driver{imagePath: $imagePath, nameSurname: $nameSurname, phoneNumber: $phoneNumber, licensePlate: $licensePlate, rating: $rating}';
  }
}