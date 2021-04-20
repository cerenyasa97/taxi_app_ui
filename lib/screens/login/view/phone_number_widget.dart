import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/components/project_text_form_field.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/components/text_validator.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/init/project_theme.dart';
import 'package:provider/provider.dart';

class PhoneNumberWidget extends StatelessWidget {
  static final _formKey = GlobalKey<FormState>();
  final Function(String) onChanged;
  final Function(bool) validator;

  PhoneNumberWidget(
      {Key key,
      @required this.onChanged,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InputDecorationTheme borderTheme = Provider.of<ProjectThemeData>(context).getThemeData.inputDecorationTheme;
    return SizedBox(
      width: context.dynamicWidth(1 / 2),
      child: Form(
        key: _formKey,
        child: ProjectTextFormField(
          contentPadding: context.medium1EdgeInsetsSymmetric,
          onChanged: (phone) {
            _formKey.currentState.validate();
            return onChanged(phone);
          },
          validator: (phone){
            validator(TextValidator.phoneValidation(phone));
          },
          onSaved: (text) {
            FocusScope.of(context).unfocus();
          },
          enabledBorder: borderTheme.enabledBorder,
          focusedBorder: borderTheme.focusedBorder,
          keyboardType: TextInputType.number,
          hintText: TextConstants.PHONE_NUMBER_HINT,
          textFormatter: [LengthLimitingTextInputFormatter(10),
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
      ),
    );
  }
}

/*
Container(
        width: context.dynamicWidth(1 / 2),
        height: context.dynamicHeight(1 / 16),
        padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(1 / 40)),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(context.dynamicWidth(1 / 40)),
        ),
        child: Form(
          key: _formKey,
          child: ProjectTextFormField(
            onChanged: (phone) {
              _formKey.currentState.validate();
              return onChanged(phone);
            },
            validator: (phone){
              validator(TextValidator.phoneValidation(phone));
            },
            onSaved: (text) {
              FocusScope.of(context).unfocus();
            },
            keyboardType: TextInputType.number,
            hintText: TextConstants.PHONE_NUMBER_HINT,
            textFormatter: [LengthLimitingTextInputFormatter(10),
            FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ));
 */