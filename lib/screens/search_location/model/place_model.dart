class PlaceModel{
  String mainText;
  String secondaryText;
  String placeID;
  List<dynamic> types;

  PlaceModel(this.mainText, this.secondaryText, this.placeID, this.types);

  PlaceModel.fromJson(Map<String, dynamic> json){
    this.mainText = json["structured_formatting"]["main_text"];
    this.secondaryText = json["structured_formatting"]["secondary_text"];
    this.placeID = json["place_id"];
    this.types = json["types"];
  }

  @override
  String toString() {
    return 'PlaceModel{mainText: $mainText, secondaryText: $secondaryText, placeID: $placeID, types: $types}';
  }
}