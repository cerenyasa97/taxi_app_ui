import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
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
      title: ProjectText(text: TextConstants.GET_WARNING_TITLE),
      content: ProjectText(
        text: TextConstants.PHONE_VERIFICATION_FIELD_ERROR,
        style: Theme.of(context).textTheme.bodyText2,
      ),
      actions: [NextPage(onTap: () => Navigator.of(context).pop())],
    );
  }
}
