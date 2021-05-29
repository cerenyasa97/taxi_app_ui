import 'package:piton_taxi_app/core/extensions/string/string_extension.dart';
import 'package:flutter/services.dart';
import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/core/extensions/theme/theme_extension.dart';
import 'package:flutter/material.dart';

class ProjectTextField extends StatefulWidget {
  final InputBorder border;
  final InputBorder focusedBorder;
  final InputBorder enabledBorder;
  final InputBorder errorBorder;
  final InputBorder disabledBorder;
  final EdgeInsetsGeometry contentPadding;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final String hintText;
  final Icon prefixIcon;
  final Icon suffixIcon;
  final Color cursorColor;
  final double textSize;
  final String initialValue;
  final bool obscureText;
  final TextInputType keyboardType;
  final int maxLines;
  final int minLines;
  final bool autofocus;
  final FocusNode fNode;
  final VoidCallback completed;
  final int maxLength;
  final TextInputAction keyboardAction;
  final TextEditingController controller;
  final Function() onTap;

  const ProjectTextField(
      {Key key,
      this.border,
      this.focusedBorder,
      this.enabledBorder,
      this.errorBorder,
      this.disabledBorder,
      this.contentPadding,
      this.onChanged,
      this.onSubmitted,
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.cursorColor,
      this.textSize,
      this.initialValue,
      this.keyboardType,
      this.obscureText,
      this.maxLines,
      this.minLines,
      this.autofocus,
      this.fNode,
      this.completed,
      this.maxLength,
      this.controller, this.onTap, this.keyboardAction})
      : super(key: key);

  @override
  _ProjectTextFieldState createState() => _ProjectTextFieldState();
}

class _ProjectTextFieldState extends State<ProjectTextField> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.text = widget.initialValue ?? "";
  }

  get controller => _controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      textInputAction: widget.keyboardAction ?? TextInputAction.done,
      focusNode: widget.fNode ?? null,
      autofocus: widget.autofocus ?? false,
      obscureText: widget.obscureText ?? false,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      controller: _controller,
      style: Theme.of(context).textTheme.bodyText2,
      decoration: InputDecoration(
        border: widget.border,
        focusedBorder: widget.focusedBorder ?? context.inputDecorationTheme.focusedBorder,
        enabledBorder: widget.enabledBorder ?? context.inputDecorationTheme.enabledBorder,
        errorBorder: widget.errorBorder ?? InputBorder.none,
        disabledBorder: widget.disabledBorder ?? InputBorder.none,
        contentPadding: widget.contentPadding ?? context.textInputPadding,
        hintText: (widget.hintText ?? LocaleKeys.general_enter).locale,
        hintStyle: context.textTheme.bodyText2.copyWith(color: Colors.blueGrey),
        suffixIcon: widget.suffixIcon ?? null,
        prefixIcon: widget.prefixIcon ?? null,
      ),
      onChanged: widget.onChanged ?? (text){},
      cursorColor: widget.cursorColor,
      onSubmitted: widget.onSubmitted ?? (text){},
      onEditingComplete: () => widget.completed ?? {},
      minLines: widget.minLines ?? 1,
      maxLines: widget.maxLines ?? 1,
      maxLength: widget.maxLength ?? null,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
