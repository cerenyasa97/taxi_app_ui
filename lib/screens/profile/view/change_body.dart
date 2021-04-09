import 'package:piton_taxi_app/core/components/project_button_bar.dart';
import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/core/components/project_text_button.dart';
import 'package:piton_taxi_app/core/components/project_text_field.dart';
import 'package:piton_taxi_app/core/constants/app/custom_text_style.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/init/project_theme.dart';
import 'package:provider/provider.dart';

class ChangeBody extends StatelessWidget {

  final Function(String) onChanged;
  final VoidCallback onSaved;
  final String label;

  const ChangeBody({Key key, this.onChanged, this.label, this.onSaved}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProjectText(
          text: label ?? "Change",
          style: CustomTextStyle.profileLabelStyle,
        ),
        context.lowSizedBoxHeight,
        ProjectTextField(
          contentPadding: context.textInputPadding,
          enabledBorder: Provider.of<ProjectThemeData>(context)
              .getThemeData
              .inputDecorationTheme
              .enabledBorder,
          focusedBorder: Provider.of<ProjectThemeData>(context)
              .getThemeData
              .inputDecorationTheme
              .focusedBorder,
          onChanged: onChanged,
        ),
        ProjectButtonBar(onPressed: () => onSaved ?? Navigator.of(context).pop()),
      ],
    );
  }
}
