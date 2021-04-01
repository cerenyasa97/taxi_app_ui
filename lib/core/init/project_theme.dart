import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/constants/light_theme.dart';
import 'package:piton_taxi_app/core/constants/dark_theme.dart';

class ProjectThemeData extends ChangeNotifier {
  ThemeData _themeData;

  ProjectThemeData(){
    _themeData = lightTheme;
  }

  ThemeData get getThemeData => _themeData;

  void changeThemeDate() {
    _themeData = _themeData == lightTheme ? darkTheme : lightTheme;
    notifyListeners();
  }
}
