import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:flutter/material.dart';

extension DividerExtension on BuildContext {
  Divider get greyMediumHorizontalDivider => Divider(
    height: 3,
    color: Colors.grey.shade400,
  );

  Widget get greyThinHorizontalDivider => Container(
    height: 1,
    width: this.dynamicWidth(250),
    color: Colors.grey.shade300,
  );

  Widget get greyThinVerticalDivider => Container(
    width: 1,
    color: Colors.grey.shade200,
  );
}