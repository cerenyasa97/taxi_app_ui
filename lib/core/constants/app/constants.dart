import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ProjectConstants{
  static const LatLng CURRENT_LOCATION = LatLng(39.7467754, 30.471961);
  static const double MAP_ZOOM = 15;

  static const double OTP_CODE_DURATION_SECOND = 30.0;

  static const int OTP_CODE_LENGTH = 6;

  static const int SLOW_PAGE_TRANSITION_DURATION = 800;
  static const int FAST_PAGE_TRANSITION_DURATION = 300;

  static const Color LOGIN_BACKGROUND_COLOR = Color(0xfff8f8f8);
  static const Color MENU_BACKGROUND_COLOR = Colors.white;
  static const Color LIGHT_WHITE = Color(0xffedf1f8);

  static const int SPLASH_SCREEN_COUNT = 3;

  static const double TEXT_FIELD_BORDER_RADIUS = 8;
  static const double BUTTON_BORDER_RADIUS = 10;
  static const double CONTAINER_BORDER_RADIUS = 15;
  static const double MENU_ITEM_BORDER_RADIUS = 37;
  static const double ALERT_DIALOG_RADIUS = 25;
  static const double ALERT_DIALOG_ICON_RADIUS = 30;
}