import 'package:flutter/material.dart';

class OTPDialogConstants{
  static FocusNode field2FNode = FocusNode();
  static FocusNode field3FNode = FocusNode();
  static FocusNode field4FNode = FocusNode();
  static FocusNode field5FNode = FocusNode();
  static FocusNode field6FNode = FocusNode();

  static getIndex(FocusNode currentFNode) {
    if(currentFNode == field2FNode) return 1;
    else if(currentFNode == field3FNode) return 2;
    else if(currentFNode == field4FNode) return 3;
    else if(currentFNode == field5FNode) return 4;
    else if(currentFNode == field6FNode) return 5;
    else return 0;
  }
}