import 'package:piton_taxi_app/core/init/theme/project_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

extension ThemeProviderExtension on BuildContext{
  ThemeData get themeData => Provider.of<ProjectThemeData>(this).themeData;

  TextTheme get textTheme => this.themeData.textTheme;

  InputDecorationTheme get inputDecorationTheme => this.themeData.inputDecorationTheme;
}