import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

extension TaxiAppContext on BuildContext {
  double get height =>
      MediaQuery
          .of(this)
          .size
          .height;

  double get width =>
      MediaQuery
          .of(this)
          .size
          .width;

  double dynamicHeight(double factor) => height * factor;

  double dynamicWidth(double factor) => width * factor;

  double textScale(size) =>
      size * MediaQuery
          .of(this)
          .textScaleFactor;

  EdgeInsetsGeometry get mediumHorizontalEdgeInsets =>
      EdgeInsets.symmetric(horizontal: this.dynamicWidth(20 / 412));

  EdgeInsetsGeometry get mediumHorizontalEdgeInsets2 =>
      EdgeInsets.symmetric(horizontal: this.dynamicWidth(15 / 412));

  EdgeInsetsGeometry get textInputPadding =>
      EdgeInsets.symmetric(horizontal: this.dynamicWidth(10 / 412));

  EdgeInsetsGeometry get homeContainerPadding => EdgeInsets.only(
      left: this.dynamicWidth(15 / 412),
      right: this.dynamicWidth(15 / 412),
      top: this.dynamicHeight(3 / 870));

  EdgeInsetsGeometry get lowEdgeInsetsAll =>
      EdgeInsets.all(this.width * 10 / 412);

  EdgeInsetsGeometry get lowEdgeInsetsSymmetric => EdgeInsets.symmetric(
      horizontal: this.dynamicWidth(15 / 412),
      vertical: this.dynamicHeight(5 / 870));

  EdgeInsetsGeometry get medium1EdgeInsetsSymmetric => EdgeInsets.symmetric(
      horizontal: this.dynamicWidth(25 / 412),
      vertical: this.dynamicHeight(15 / 870));

  EdgeInsetsGeometry get mediumEdgeInsetsSymmetric => EdgeInsets.symmetric(
      horizontal: this.dynamicWidth(20 / 412),
      vertical: this.dynamicHeight(20 / 870));

  SizedBox get lowestSizedBoxHeight =>
      SizedBox(height: this.dynamicHeight(1 / 87),);

  SizedBox get lowSizedBoxHeight =>
      SizedBox(height: this.dynamicHeight(2 / 87),);

  SizedBox get mediumSizedBoxHeight =>
      SizedBox(height: this.dynamicHeight(5 / 87),);

  SizedBox get mediumSizedBoxWidth =>
      SizedBox(width: this.dynamicHeight(8 / 87),);

}

extension DurationExtension on BuildContext {
  Duration get otpCodeDuration => Duration(seconds: 30.toInt());
}

extension NextFocusNode on BuildContext {
  nextFocusNode(FocusNode fNode) => fNode.requestFocus();
}

extension GoogleMapExtension on BuildContext {
  MapType normalToSatellite(MapType currentType) =>
      currentType == MapType.normal ? MapType.satellite : MapType.normal;
}
