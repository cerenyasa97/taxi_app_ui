import 'package:piton_taxi_app/core/extensions/context/sized_box_extension.dart';
import 'package:piton_taxi_app/core/components/button_bar/project_button_bar.dart';
import 'package:piton_taxi_app/core/components/text_field/project_text_field.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/core/extensions/theme/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/widgets/general/get_phone_number.dart';

class ChangeBody extends StatefulWidget {
  final Function(String) onChanged;
  final TextInputType keyboardType;
  final VoidCallback onSaved;
  final String label;
  final String hint;
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
    this.hint,
  }) : super(key: key);

  @override
  _ChangeBodyState createState() => _ChangeBodyState();
}

class _ChangeBodyState extends State<ChangeBody> {
  static TextEditingController controller;
  var validation = false;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProjectTextLocale(
          text: widget.label ?? "Change",
          style: context.themeData.textTheme.bodyText1
              .copyWith(color: Colors.grey.shade700),
        ),
        context.lowSizedBoxHeight,
        widget.label == LocaleKeys.profile_contactInformation_phoneLabel
            ? GetPhoneNumber(
                width: double.infinity,
                onChanged: (text) => widget.onChanged(text),
              )
            : ProjectTextField(
                hintText: widget.hint,
                controller: controller,
                onTap: () => print("tapped"),
                minLines: widget.minLine ?? 1,
                maxLines: widget.maxLine ?? 1,
                keyboardType: widget.keyboardType ?? TextInputType.text,
                enabledBorder:
                    context.themeData.inputDecorationTheme.enabledBorder,
                focusedBorder:
                    context.themeData.inputDecorationTheme.focusedBorder,
                onChanged: (text) => widget.onChanged(text),
              ),
        ProjectButtonBar(
            onPressed: () => widget.onSaved ?? Navigator.of(context).pop()),
      ],
    );
  }
}
