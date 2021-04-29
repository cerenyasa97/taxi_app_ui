import 'package:piton_taxi_app/core/extensions/sized_box_extension.dart';
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
  final int minLine;
  final int maxLine;

  const ChangeBody({
    Key key,
    this.onChanged,
    this.label,
    this.onSaved,
    this.keyboardType,
    this.minLine,
    this.maxLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData =
        Provider.of<ProjectThemeData>(context).getThemeData;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProjectText(
          text: label ?? "Change",
          style: themeData.textTheme.bodyText1
              .copyWith(color: Colors.grey.shade700),
        ),
        context.lowSizedBoxHeight,
        ProjectTextField(
          minLines: minLine ?? 1,
          maxLines: maxLine ?? 1,
          autofocus: true,
          keyboardType: keyboardType ?? TextInputType.text,
          enabledBorder: themeData.inputDecorationTheme.enabledBorder,
          focusedBorder: themeData.inputDecorationTheme.focusedBorder,
          onChanged: onChanged,
        ),
        ProjectButtonBar(
            onPressed: () => onSaved ?? Navigator.of(context).pop()),
      ],
    );
  }
}
