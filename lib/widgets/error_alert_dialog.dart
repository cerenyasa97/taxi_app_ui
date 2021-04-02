import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'next_page.dart';

class ErrorAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(context.dynamicWidth(20 / 412)),
      ),
      title: ProjectText(text: getWarningTitle),
      content: ProjectText(
        text: phoneVerificationFailedError,
        style: Theme.of(context).textTheme.bodyText2,
      ),
      actions: [NextPage(onTap: () => Navigator.of(context).pop())],
    );
  }
}
