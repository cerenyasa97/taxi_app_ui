import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension TaxiAppContext on BuildContext {
  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  double dynamicHeight(double factor) => height * factor;

  double dynamicWidth(double factor) => width * factor;

  double textScale(size) => size * MediaQuery.of(this).textScaleFactor;

  
}
