import 'package:flutter/services.dart';
import 'package:piton_taxi_app/core/extensions/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/init/project_theme.dart';
import 'package:provider/provider.dart';
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
  final String label;
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
  final TextEditingController controller;

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
      this.label,
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
      this.controller})
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
    final inputTheme = Provider.of<ProjectThemeData>(context)
        .getThemeData
        .inputDecorationTheme;
    final textTheme = Provider.of<ProjectThemeData>(context).getThemeData.textTheme;
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      textInputAction: TextInputAction.done,
      focusNode: widget.fNode ?? null,
      autofocus: widget.autofocus ?? false,
      obscureText: widget.obscureText ?? false,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      controller: _controller,
      style: Theme.of(context).textTheme.bodyText2,
      decoration: InputDecoration(
        border: widget.border,
        focusedBorder: widget.focusedBorder ?? inputTheme.focusedBorder,
        enabledBorder: widget.enabledBorder ?? inputTheme.enabledBorder,
        errorBorder: widget.errorBorder ?? InputBorder.none,
        disabledBorder: widget.disabledBorder ?? InputBorder.none,
        contentPadding: widget.contentPadding ?? context.textInputPadding,
        hintText: widget.hintText ?? "Enter...",
        hintStyle: textTheme.bodyText2.copyWith(color: Colors.blueGrey),
        labelText: widget.label ?? null,
        suffixIcon: widget.suffixIcon ?? null,
        prefixIcon: widget.prefixIcon ?? null,
      ),
      onChanged: (text) =>
          widget.onChanged != null ? widget.onChanged(text) : {},
      cursorColor: widget.cursorColor,
      onSubmitted: (text) =>
          widget.onSubmitted != null ? widget.onSubmitted(text) : {},
      onEditingComplete: () => widget.completed ?? {},
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength ?? null,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
