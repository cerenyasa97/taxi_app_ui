import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/core/components/project_text_field.dart';
import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/init/project_theme.dart';
import 'package:provider/provider.dart';
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
      title: ProjectText(text: title, style: Provider.of<ProjectThemeData>(context).getThemeData.textTheme.headline6,),
      content: ProjectTextField(
        enabledBorder: Provider.of<ProjectThemeData>(context).getThemeData.inputDecorationTheme.enabledBorder,
        focusedBorder: Provider.of<ProjectThemeData>(context).getThemeData.inputDecorationTheme.focusedBorder,
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
