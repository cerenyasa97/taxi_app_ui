import 'package:piton_taxi_app/core/constants/methods/input_formatter.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/components/text_field/project_text_form_field.dart';
import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/components/text_validator.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';

class PhoneNumberWidget extends StatelessWidget {
  static final _formKey = GlobalKey<FormState>();
  final FocusNode fNode;
  final Function(String) onChanged;
  final Function(String) onSaved;
  final Function(bool) validator;

  PhoneNumberWidget(
      {Key key,
      @required this.onChanged,
      this.validator, this.fNode, this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(206),
      child: Form(
        key: _formKey,
        child: ProjectTextFormField(
          focusNode: fNode,
          contentPadding: context.medium1EdgeInsetsSymmetric,
          onChanged: (phone) {
            _formKey.currentState.validate();
            return onChanged(phone);
          },
          validator: (phone){
            validator(TextValidator.phoneValidation(phone));
          },
          onSaved: (text) => onSaved(text),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          keyboardType: TextInputType.number,
          hintText: LocaleKeys.login_phoneNumberHint,
          textFormatter: [
            InputFormatter.instance.phoneFormatter
          ],
        ),
      ),
    );
  }
}
