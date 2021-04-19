import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/components/project_button_bar.dart';
import 'package:piton_taxi_app/core/components/project_text_field.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/core/init/project_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ChangeBody extends StatelessWidget {
  final Function(String) onChanged;
  final TextInputType keyboardType;
  final VoidCallback onSaved;
  final String label;

  const ChangeBody(
      {Key key, this.onChanged, this.label, this.onSaved, this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Provider.of<ProjectThemeData>(context)
              .getThemeData;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProjectText(
          text: label ?? "Change",
          style: themeData
              .textTheme
              .bodyText1
              .copyWith(color: Colors.grey.shade700),
        ),
        context.lowSizedBoxHeight,
        ProjectTextField(
          keyboardType: keyboardType ?? TextInputType.text,
          contentPadding: context.textInputPadding,
          enabledBorder: themeData
              .inputDecorationTheme
              .enabledBorder,
          focusedBorder: themeData
              .inputDecorationTheme
              .focusedBorder,
          onChanged: onChanged,
        ),
        ProjectButtonBar(
            onPressed: () => onSaved ?? Navigator.of(context).pop()),
      ],
    );
  }
}
