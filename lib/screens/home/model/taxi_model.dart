class Taxi {
  int id;
  Driver driver;
  Location location;

  Taxi({this.id, this.driver, this.location});

  Taxi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driver =
    json['driver'] != null ? new Driver.fromJson(json['driver']) : null;
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.driver != null) {
      data['driver'] = this.driver.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    return data;
  }
}

class Driver {
  String name;
  String phoneNumber;

  Driver({this.name, this.phoneNumber});

  Driver.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}

class Location {
  double latitude;
  double longitude;

  Location({this.latitude, this.longitude});

  Location.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
