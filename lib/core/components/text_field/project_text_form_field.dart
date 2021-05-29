import 'package:piton_taxi_app/core/extensions/string/string_extension.dart';
import 'package:piton_taxi_app/core/extensions/theme/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';

class ProjectTextFormField extends StatelessWidget {
  final InputBorder border;
  final InputBorder focusedBorder;
  final InputBorder enabledBorder;
  final InputBorder errorBorder;
  final InputBorder disabledBorder;
  final EdgeInsetsGeometry contentPadding;
  final Function(String) onChanged;
  final Function(String) onSaved;
  final Function(String) validator;
  final VoidCallback onEditingComplete;
  final String hintText;
  final Icon prefixIcon;
  final Icon suffixIcon;
  final Color cursorColor;
  final double textSize;
  final String initialValue;
  final TextInputType keyboardType;
  final TextStyle errorStyle;
  final List<TextInputFormatter> textFormatter;
  final AutovalidateMode autoValidateMode;
  final TextAlign alignment;
  final FocusNode focusNode;
  final bool autofocus;

  const ProjectTextFormField(
      {Key key,
      this.border,
      this.focusedBorder,
      this.enabledBorder,
      this.errorBorder,
      this.disabledBorder,
      this.contentPadding,
      this.onChanged,
      this.onSaved,
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.cursorColor,
      this.textSize,
      this.initialValue,
      this.validator,
      this.keyboardType,
      this.errorStyle,
      this.textFormatter,
      this.onEditingComplete,
      this.autoValidateMode,
      this.alignment,
      this.focusNode,
        this.autofocus
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode ?? null,
      keyboardType: keyboardType ?? TextInputType.text,
      style: Theme.of(context).textTheme.subtitle1,
      decoration: InputDecoration(
        errorStyle: errorStyle ?? TextStyle(height: 0),
        border: border ?? InputBorder.none,
        enabledBorder: enabledBorder ?? context.inputDecorationTheme.enabledBorder,
        focusedBorder: focusedBorder ?? context.inputDecorationTheme.focusedBorder,
        errorBorder: errorBorder ?? InputBorder.none,
        disabledBorder: disabledBorder ?? InputBorder.none,
        contentPadding: contentPadding ?? null,
        hintStyle: context.textTheme.headline6.copyWith(color: Colors.grey.shade600),
        hintText: (hintText ?? LocaleKeys.general_enter).locale,
        suffixIcon: suffixIcon ?? null,
        prefixIcon: prefixIcon ?? null,
      ),
      onChanged: onChanged,
      onFieldSubmitted: onSaved,
      onSaved: onSaved,
      onEditingComplete: onEditingComplete,
      validator: validator,
      inputFormatters: textFormatter ?? [],
      autovalidateMode: autoValidateMode ?? AutovalidateMode.always,
      textAlign: alignment ?? TextAlign.start,
      autofocus: autofocus ?? false,
    );
  }
}
