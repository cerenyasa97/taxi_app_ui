import 'package:piton_taxi_app/core/components/button_bar/project_button_bar.dart';
import 'package:piton_taxi_app/core/extensions/string/string_extension.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';import 'package:piton_taxi_app/core/extensions/theme/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';

class BookLaterDialog extends StatelessWidget {
  const BookLaterDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint(LocaleKeys.bookLaterInstruction.locale);
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.dynamicWidth(10))),
      title: Center(
        child: Text(
          LocaleKeys.bookLaterInstruction.locale,
          style:
              context.textTheme.headline6.copyWith(color: Colors.grey.shade600),
        ),
      ),
      content: Container(
        height: context.dynamicHeight(150),
        width: context.dynamicWidth(340),
        child: CupertinoDatePicker(
          initialDateTime: DateTime.now(),
          onDateTimeChanged: (DateTime dateTime) {},
          use24hFormat: true,
          maximumDate: DateTime(DateTime.now().year + 1, 12, 30),
          minimumYear: DateTime.now().year,
          maximumYear: DateTime.now().year + 1,
          mode: CupertinoDatePickerMode.dateAndTime,
        ),
      ),
      actions: [
        ProjectButtonBar(onPressed: (){})
      ],
    );
  }
}
