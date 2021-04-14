import 'package:flutter/material.dart';

class CustomTextStyle {
  static TextStyle lightGrey16w4 = TextStyle(
      fontSize: 16, color: Colors.grey.shade700, fontWeight: FontWeight.w400);
  static TextStyle lightGrey18w5 = TextStyle(
      fontSize: 16, color: Colors.grey.shade800, fontWeight: FontWeight.w500);
  static TextStyle lightGrey20w7 = TextStyle(
      fontSize: 20, color: Colors.grey.shade700, fontWeight: FontWeight.w700);
  static TextStyle grey12w5 = TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500);
  static TextStyle grey20w6 = TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.w400);

  static TextStyle amber20w8 = TextStyle(
      color: Colors.amber, fontSize: 18.0, fontWeight: FontWeight.w800);

  static TextStyle lightBlack18 =
      TextStyle(color: Colors.black87, fontSize: 18.0);
  static TextStyle lightBlack18w5 =
  TextStyle(color: Colors.black45, fontSize: 18.0, fontWeight: FontWeight.bold);
  static TextStyle black16w6 =
  TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500);
  static TextStyle black18w6 =
  TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500);
  static TextStyle black50w7 =
  TextStyle(fontSize: 50, color: Colors.black, fontWeight: FontWeight.w700);

  static TextStyle white11w8 = TextStyle(
      color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.w800);

  static var regularTextStyle = TextStyle(
      fontSize: 14, fontFamily: "Roboto", fontWeight: FontWeight.w400);
  static var mediumTextStyle = TextStyle(
      fontSize: 14, fontFamily: "Roboto", fontWeight: FontWeight.w500);
  static var boldTextStyle = TextStyle(
      fontSize: 14, fontFamily: "Roboto", fontWeight: FontWeight.w700);
  static var oldBlackTextStyle = TextStyle(
      fontSize: 14, fontFamily: "Roboto", fontWeight: FontWeight.w900);
}
