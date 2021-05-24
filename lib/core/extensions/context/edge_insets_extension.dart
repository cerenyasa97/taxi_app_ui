import 'project_context_extension.dart';
import 'package:flutter/material.dart';

extension EdgeInsetsGeometryExtension on BuildContext {
  EdgeInsetsGeometry get edgeInsetsOnly => EdgeInsets.only(
      top: this.dynamicHeight(50),
      left: this.dynamicWidth(15),
      right: this.dynamicWidth(15)
  );

  EdgeInsetsGeometry get lowestEdgeInsetsHorizontal =>
      EdgeInsets.symmetric(horizontal: this.dynamicWidth(4));

  EdgeInsetsGeometry get lowestEdgeInsetsHorizontal2 =>
      EdgeInsets.symmetric(horizontal: this.dynamicWidth(15));

  EdgeInsetsGeometry get lowEdgeInsetsHorizontal =>
      EdgeInsets.symmetric(horizontal: this.dynamicWidth(30));

  EdgeInsetsGeometry get mediumHorizontalEdgeInsets =>
      EdgeInsets.symmetric(horizontal: this.dynamicWidth(20));

  EdgeInsetsGeometry get mediumHorizontalEdgeInsets2 =>
      EdgeInsets.symmetric(horizontal: this.dynamicWidth(15));

  EdgeInsetsGeometry get lowEdgeInsetsVertical =>
      EdgeInsets.symmetric(vertical: this.dynamicHeight(5));

  EdgeInsetsGeometry get textInputPadding => EdgeInsets.all(this.dynamicWidth(10));

  EdgeInsetsGeometry get largeEdgeInsetsSymmetric => EdgeInsets.symmetric(
      vertical: this.dynamicHeight(50),
      horizontal: this.dynamicWidth(20));

  EdgeInsetsGeometry get homeContainerPadding => EdgeInsets.only(
      left: this.dynamicWidth(15),
      right: this.dynamicWidth(15),
      top: this.dynamicHeight(3));

  EdgeInsetsGeometry get lowEdgeInsetsAll =>
      EdgeInsets.all(this.dynamicWidth(15));

  EdgeInsetsGeometry get lowest2EdgeInsetsAll => EdgeInsets.all(this.dynamicHeight(12));

  EdgeInsetsGeometry get lowestEdgeInsetsAll =>
      EdgeInsets.all(this.dynamicWidth(9));

  EdgeInsetsGeometry get lowEdgeInsetsSymmetric => EdgeInsets.only(
      top: this.dynamicHeight(20),
      bottom: this.dynamicHeight(10)
  );

  EdgeInsetsGeometry get medium1EdgeInsetsSymmetric => EdgeInsets.symmetric(
      horizontal: this.dynamicWidth(25),
      vertical: this.dynamicHeight(15));

  EdgeInsetsGeometry get mediumEdgeInsetsSymmetric => EdgeInsets.symmetric(
      horizontal: this.dynamicWidth(20),
      vertical: this.dynamicHeight(20));

  EdgeInsetsGeometry get largestEdgeInsetsSymmetric => EdgeInsets.symmetric(
      horizontal: this.dynamicWidth(30),
      vertical: this.dynamicHeight(20));

  EdgeInsetsGeometry get heighestEdgeInsetsSymmetric => EdgeInsets.symmetric(
    horizontal: this.dynamicWidth(20),
    vertical: this.dynamicHeight(220)
  );

  EdgeInsetsGeometry get topEdgeInsets => EdgeInsets.only(top: this.dynamicHeight(25));
}
