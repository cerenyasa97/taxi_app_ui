extension DateTimeExtension on DateTime{

  String getMonth(int index) {
    List<String> months = [
      "",
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November"
    ];
    return months[index];
  }

  String get dateString =>
      this.day.toString() + " " + getMonth(this.month) + " " +
          this.year.toString();

  String get timeString =>
      this.hour.toString() + " : " + this.minute.toString();
}