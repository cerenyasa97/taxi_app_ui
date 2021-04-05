import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final String label;
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
      this.label,
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
        focusedBorder: focusedBorder ?? InputBorder.none,
        enabledBorder: enabledBorder ?? InputBorder.none,
        errorBorder: errorBorder ?? InputBorder.none,
        disabledBorder: disabledBorder ?? InputBorder.none,
        contentPadding: contentPadding ?? null,
        hintText: hintText ?? "Enter...",
        labelText: label ?? null,
        suffixIcon: suffixIcon ?? null,
        prefixIcon: prefixIcon ?? null,
      ),
      onChanged: onChanged,
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
