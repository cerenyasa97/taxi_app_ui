import 'package:piton_taxi_app/core/init/navigation/pages_import.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension TaxiAppContext on BuildContext {
  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  double dynamicHeight(double factor) => height * factor / 870;

  double dynamicWidth(double factor) => width * factor / 412;

  double textScale(size) => size * MediaQuery.of(this).textScaleFactor;

  closeKeyboard() => FocusScope.of(this).unfocus();
}

extension DurationExtension on BuildContext {
  Duration get otpCodeDuration => Duration(seconds: 30.toInt());
}

extension NextFocusNode on BuildContext {
  nextFocusNode(FocusNode fNode) => fNode.requestFocus();
}



