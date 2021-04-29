class DirectionModel{
  String distanceText;
  String durationText;
  String encodedPoints;
  int distance;
  int duration;

  DirectionModel(
      this.distanceText, this.durationText, this.encodedPoints, this.distance, this.duration);

  @override
  String toString() {
    return 'DirectionModel{distanceText: $distanceText, durationText: $durationText, encodedPoints: $encodedPoints, distance: $distance, duration: $duration}';
  }
}