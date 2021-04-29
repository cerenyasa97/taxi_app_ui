import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/extensions/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/components/project_text_field.dart';
import 'package:piton_taxi_app/core/extensions/theme_extension.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:flutter/material.dart';
import 'alert_dialog_button.dart';

class LocationSearchAlertDialog extends StatelessWidget {

  final String title;
  final Function(String) onChanged;
  final String initialText;

  const LocationSearchAlertDialog({Key key, @required this.title, @required this.onChanged, this.initialText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.dynamicWidth(30/412))
      ),
      title: ProjectText(text: title, style: context.textTheme.headline5.copyWith(fontWeight: FontWeight.w600),),
      content: ProjectTextField(
        enabledBorder: context.inputDecorationTheme.enabledBorder,
        focusedBorder: context.inputDecorationTheme.focusedBorder,
        contentPadding: context.textInputPadding,
        initialValue: initialText,
        onChanged: onChanged,
      ),
      actions: [
        Container(
          width: double.maxFinite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AlertDialogButton(icon: Icons.home, onPressed: () {Navigator.of(context).pop();}),
              AlertDialogButton(icon: Icons.home_work, onPressed: () {Navigator.of(context).pop();}),
              AlertDialogButton(icon: Icons.done, onPressed: () {Navigator.of(context).pop();}),
            ],
          ),
        )
      ],
    );
  }
}
