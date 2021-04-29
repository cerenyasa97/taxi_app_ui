import 'package:flutter/material.dart';

extension DividerExtension on BuildContext {
  Divider get greyThinHorizontalDivider => Divider(
    height: 3,
    color: Colors.grey.shade400,
  );

  Widget get greyThinVerticalDivider => Container(
    width: 1,
    color: Colors.grey.shade200,
  );
}