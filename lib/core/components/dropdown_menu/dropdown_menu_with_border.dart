import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/extensions/theme/theme_extension.dart';

class DropDownMenuWithBorder extends StatefulWidget {

  final String hint;
  final List<dynamic> dropdownList;
  final Function(String) onChanged;

  DropDownMenuWithBorder({Key key, this.hint, @required this.dropdownList, this.onChanged}) : super(key: key);

  @override
  _DropDownMenuWithBorderState createState() => _DropDownMenuWithBorderState(dropdownList.first);
}

class _DropDownMenuWithBorderState extends State<DropDownMenuWithBorder> {

  String currentValue;

  _DropDownMenuWithBorderState(int value){
    currentValue = value.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(5)),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(context.dynamicWidth(8))
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          items: widget.dropdownList
              .map((e) => DropdownMenuItem(
            child: Text(e.toString()),
            value: e.toString(),
          ))
              .toList(),
          style: context.textTheme.bodyText1,
          value: currentValue,
          onChanged: (String value) {
            setState(() {
              currentValue = value.toString();
            });
            widget.onChanged(value ?? "");
          },
        ),
      ),
    );
  }
}
