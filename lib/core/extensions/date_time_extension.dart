extension DateTimeExtension on DateTime {
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

  int getMonthDayCount(int index) {
    List<int> daysPerMonth = [
      0,
      31,
      28,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31
    ];
    return daysPerMonth[index];
  }

  String get dateString =>
      this.day.toString() +
      " " +
      getMonth(this.month) +
      " " +
      this.year.toString();

  String get timeString {
    String hour;
    String minute;
    if(this.hour == 0) hour = "00";
    else if(this.hour < 10) hour = "0${this.hour}";
    else hour = this.hour.toString();
    if(this.minute == 0) minute = "00";
    else if (this.minute < 10) minute = "0${this.minute}";
    else minute = this.minute.toString();
    print("in time String" + hour + ":" + minute);
    return (hour + " : " + minute);
  }


  int addHour(int time) {
    var currentHour = DateTime.now().hour;
    if (currentHour + time < 24) {
      currentHour = currentHour + time;
    } else {
      currentHour = currentHour + time - 24;
    }
    return currentHour;
  }

  List<int> addDay(int day) {
    var currentDay = DateTime.now().day;
    var currentMonth = DateTime.now().month;
    var currentYear = DateTime.now().year;
    if (currentDay + day <= this.getMonthDayCount(currentMonth)) {
      currentDay = currentDay + day;
    } else if (currentDay + day > this.getMonthDayCount(currentMonth)) {
      currentDay = 1;
      if (currentMonth < 12) {
        currentMonth += 1;
      } else {
        currentMonth = 1;
        currentYear += 1;
      }
    }
    return [currentDay, currentMonth, currentYear];
  }

  String addDayString(int day) {
    List<int> dateList = this.addDay(day);
    return "${dateList[0]}/${dateList[1]}/${dateList[2]}";
  }

  String addHourString(int hour) {
    var list = this.addHour(hour);
    return "$list:${DateTime.now().minute}";
  }
}
