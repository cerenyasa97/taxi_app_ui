import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/base/view/base_view.dart';
import 'package:flutter/material.dart';
import 'change_body.dart';

class ChangeNameSurname extends BaseView {
  ChangeNameSurname({Key key}) : super(key: key);

  @override
  _ChangeNameSurnameState createState() => _ChangeNameSurnameState();
}

class _ChangeNameSurnameState extends BaseState<ChangeNameSurname> {
  InputBorder enabled;
  InputBorder focused;
  String nameSurname = "";

  @override
  String appBarTitle() => TextConstants.CHANGE_NAME_SURNAME;

  @override
  Widget body() {
    return ChangeBody(
      label: TextConstants.PROFILE_NAME_LABEL,
      onChanged: (nameSurnameText) {
        nameSurname = nameSurnameText;
      }
    );
  }

  @override
  EdgeInsetsGeometry padding() => context.mediumEdgeInsetsSymmetric;
}