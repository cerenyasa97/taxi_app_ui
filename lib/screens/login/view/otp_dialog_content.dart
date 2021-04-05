import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/components/project_text_form_field.dart';
import 'package:piton_taxi_app/core/constants/constants.dart';
import 'package:piton_taxi_app/core/init/project_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpDialogContent extends StatefulWidget {

  final Function(List<int>) onChanged;

  const OtpDialogContent({Key key, this.onChanged}) : super(key: key);

  @override
  _OtpDialogContentState createState() => _OtpDialogContentState();
}

class _OtpDialogContentState extends State<OtpDialogContent> {
  FocusNode field2FNode;
  FocusNode field3FNode;
  FocusNode field4FNode;
  FocusNode field5FNode;
  FocusNode field6FNode;
  List<int> otpCode;

  @override
  void initState() {
    super.initState();
    field2FNode = FocusNode();
    field3FNode = FocusNode();
    field4FNode = FocusNode();
    field5FNode = FocusNode();
    field6FNode = FocusNode();
    otpCode = List.generate(otpCodeLength, (index) => 0);
  }

  @override
  void dispose() {
    field2FNode.dispose();
    field3FNode.dispose();
    field4FNode.dispose();
    field5FNode.dispose();
    field6FNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _codeField(context, autoFocus: true, nextFNode: field2FNode),
        _codeField(context, currentFNode: field2FNode, nextFNode: field3FNode),
        _codeField(context, currentFNode: field3FNode, nextFNode: field4FNode),
        _codeField(context, currentFNode: field4FNode, nextFNode: field5FNode),
        _codeField(context, currentFNode: field5FNode, nextFNode: field6FNode),
        _codeField(context, currentFNode: field6FNode),
      ],
    );
  }

  SizedBox _codeField(BuildContext context,
      {bool autoFocus = false, FocusNode currentFNode, FocusNode nextFNode}) {
    return SizedBox(
        width: context.dynamicWidth(35/412),
        child: ProjectTextFormField(
          autofocus: autoFocus ?? false,
          focusNode: currentFNode ?? FocusNode(),
          keyboardType: TextInputType.number,
          enabledBorder: otpVerificationEnabledBorder,
          focusedBorder: otpVerificationFocusedBorder,
          hintText: "0",
          alignment: TextAlign.center,
          textFormatter: [LengthLimitingTextInputFormatter(1)],
          cursorColor: Provider.of<ProjectThemeData>(context).getThemeData.textSelectionTheme.cursorColor,
          onChanged: (text) {
            if(text.isNotEmpty && otpCode.length <= 6) otpCode[_getIndex(currentFNode)] = int.parse(text);
            if(currentFNode != field6FNode) nextField(text, nextFNode);
            widget.onChanged(otpCode);
          },
        ),
      );
  }

  void nextField(String text, FocusNode focusNode) {
    if(text.length == 1) context.nextFocusNode(focusNode);
  }

  _getIndex(FocusNode currentFNode) {
    if(currentFNode == field2FNode) return 1;
    else if(currentFNode == field3FNode) return 2;
    else if(currentFNode == field4FNode) return 3;
    else if(currentFNode == field5FNode) return 4;
    else if(currentFNode == field6FNode) return 5;
    else return 0;
  }
}