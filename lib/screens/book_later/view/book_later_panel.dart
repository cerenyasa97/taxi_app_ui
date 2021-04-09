import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookLaterPanel extends StatelessWidget {
  final Function(DateTime) onDateTimeChanged;

  const BookLaterPanel({Key key, @required this.onDateTimeChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(20/87),
      child: CupertinoDatePicker(
        initialDateTime: DateTime.now(),
        onDateTimeChanged: (DateTime newDate) => onDateTimeChanged(newDate),
        use24hFormat: true,
        maximumDate: new DateTime(DateTime.now().year + 1, 12, 30),
        minimumYear: DateTime.now().year,
        maximumYear: DateTime.now().year + 1,
        minuteInterval: 1,
        mode: CupertinoDatePickerMode.dateAndTime,
      ),
    );
  }
}
