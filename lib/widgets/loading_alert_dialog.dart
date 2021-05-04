import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/init/project_routes.dart';
import 'package:piton_taxi_app/widgets/custom_progress_indicator.dart';

class LoadingAlertDialog extends StatefulWidget {
  @override
  _LoadingAlertDialogState createState() => _LoadingAlertDialogState();
}

class _LoadingAlertDialogState extends State<LoadingAlertDialog> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5)).then((value) => Navigator.of(context)
        .pushReplacement(ProjectRoute.generateSlidePageRouteBuilder(
            Pages.TRIP_DURING,
            ProjectConstants.FAST_PAGE_TRANSITION_DURATION)));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.dynamicWidth(25 / 412))),
      content: Container(
        height: context.dynamicHeight(10 / 87),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomProgressIndicator(),
            ProjectText(text: "Searching taxi..."),
          ],
        ),
      ),
    );
  }
}
