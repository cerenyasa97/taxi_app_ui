import 'package:flutter/material.dart';

class CustomTextStyle {
  static TextStyle profileLabelStyle = TextStyle(
      fontSize: 16, color: Colors.grey.shade700, fontWeight: FontWeight.w400);

  static TextStyle profileSectionLabelStyle = TextStyle(
      fontSize: 16, color: Colors.grey.shade800, fontWeight: FontWeight.w500);

  static TextStyle profileGeneralLabelStyle =
      TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600);

  static TextStyle yellowTextStyle = TextStyle(
      color: Colors.amber, fontSize: 20.0, fontWeight: FontWeight.w800);

  static var regularTextStyle = TextStyle(
      fontSize: 14, fontFamily: "Roboto", fontWeight: FontWeight.w400);
  static var mediumTextStyle = TextStyle(
      fontSize: 14, fontFamily: "Roboto", fontWeight: FontWeight.w500);
  static var boldTextStyle = TextStyle(
      fontSize: 14, fontFamily: "Roboto", fontWeight: FontWeight.w700);
  static var blackTextStyle = TextStyle(
      fontSize: 14, fontFamily: "Roboto", fontWeight: FontWeight.w900);
}
