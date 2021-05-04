import 'project_context_extension.dart';
import 'package:flutter/material.dart';

extension EdgeInsetsGeometryExtension on BuildContext {
  EdgeInsetsGeometry get edgeInsetsOnly => EdgeInsets.only(
      top: this.dynamicHeight(5 / 87),
      left: this.dynamicWidth(15 / 412),
      right: this.dynamicWidth(15 / 412)
  );

  EdgeInsetsGeometry get lowestEdgeInsetsHorizontal =>
      EdgeInsets.symmetric(horizontal: this.dynamicWidth(4 / 412));

  EdgeInsetsGeometry get lowEdgeInsetsHorizontal =>
      EdgeInsets.symmetric(horizontal: this.dynamicWidth(30 / 412));

  EdgeInsetsGeometry get mediumHorizontalEdgeInsets =>
      EdgeInsets.symmetric(horizontal: this.dynamicWidth(20 / 412));

  EdgeInsetsGeometry get mediumHorizontalEdgeInsets2 =>
      EdgeInsets.symmetric(horizontal: this.dynamicWidth(15 / 412));

  EdgeInsetsGeometry get lowEdgeInsetsVertical =>
      EdgeInsets.symmetric(vertical: this.dynamicHeight(5 / 870));

  EdgeInsetsGeometry get textInputPadding => EdgeInsets.symmetric(
      horizontal: this.dynamicWidth(10 / 412),
      vertical: this.dynamicHeight(1 / 87));

  EdgeInsetsGeometry get largeEdgeInsetsSymmetric => EdgeInsets.symmetric(
      vertical: this.dynamicHeight(5 / 87),
      horizontal: this.dynamicWidth(15 / 412));

  EdgeInsetsGeometry get homeContainerPadding => EdgeInsets.only(
      left: this.dynamicWidth(15 / 412),
      right: this.dynamicWidth(15 / 412),
      top: this.dynamicHeight(3 / 870));

  EdgeInsetsGeometry get lowEdgeInsetsAll =>
      EdgeInsets.all(this.width * 10 / 412);

  EdgeInsetsGeometry get lowEdgeInsetsSymmetric => EdgeInsets.symmetric(
      horizontal: this.dynamicWidth(15 / 412),
      vertical: this.dynamicHeight(7 / 870));

  EdgeInsetsGeometry get medium1EdgeInsetsSymmetric => EdgeInsets.symmetric(
      horizontal: this.dynamicWidth(25 / 412),
      vertical: this.dynamicHeight(15 / 870));

  EdgeInsetsGeometry get mediumEdgeInsetsSymmetric => EdgeInsets.symmetric(
      horizontal: this.dynamicWidth(20 / 412),
      vertical: this.dynamicHeight(20 / 870));

  EdgeInsetsGeometry get largestEdgeInsetsSymmetric => EdgeInsets.symmetric(
      horizontal: this.dynamicWidth(30 / 412),
      vertical: this.dynamicHeight(2 / 87));
}
