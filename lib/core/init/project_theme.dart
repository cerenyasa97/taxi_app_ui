import 'package:flutter/material.dart';
import 'file:///C:/Users/Ceren/Desktop/piton_taxi_app/lib/core/constants/theme/light_theme.dart';
import 'file:///C:/Users/Ceren/Desktop/piton_taxi_app/lib/core/constants/theme/dark_theme.dart';

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
