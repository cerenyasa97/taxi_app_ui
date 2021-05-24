import 'package:flutter/material.dart';

class LanguagesManager{
  static LanguagesManager _instance;
  static LanguagesManager get instance{
    if(_instance == null) _instance = LanguagesManager._init();
    return _instance;
  }

  LanguagesManager._init();

  final enLocale = Locale("en", "US");
  final trLocale = Locale("tr", "TR");

  List<Locale> get supportedLocales => [enLocale, trLocale];
}