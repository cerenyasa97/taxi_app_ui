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
  final bool obsecureText;
  final TextInputType keyboardType;

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
      this.obsecureText})
      : super(key: key);

  @override
  _ProjectTextFieldState createState() => _ProjectTextFieldState();
}

class _ProjectTextFieldState extends State<ProjectTextField> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.text = widget.initialValue ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obsecureText ?? false,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      controller: _controller,
      style: Theme.of(context).textTheme.subtitle1,
      decoration: InputDecoration(
        border: widget.border,
        focusedBorder: widget.focusedBorder ?? InputBorder.none,
        enabledBorder: widget.enabledBorder ?? InputBorder.none,
        errorBorder: widget.errorBorder ?? InputBorder.none,
        disabledBorder: widget.disabledBorder ?? InputBorder.none,
        contentPadding: widget.contentPadding ?? null,
        hintText: widget.hintText ?? "Enter...",
        labelText: widget.label ?? null,
        suffixIcon: widget.suffixIcon ?? null,
        prefixIcon: widget.prefixIcon ?? null,
      ),
      onChanged: (text) =>
          widget.onChanged != null ? widget.onChanged(text) : {},
      cursorColor: widget.cursorColor,
      onSubmitted: (text) =>
          widget.onSubmitted != null ? widget.onSubmitted(text) : {},
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
