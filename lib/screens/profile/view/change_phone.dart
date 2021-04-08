import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/base/view/base_view.dart';
import 'package:flutter/material.dart';
import 'change_body.dart';

class ChangePhone extends BaseView {
  ChangePhone({Key key}) : super(key: key);

  @override
  _ChangePhoneState createState() => _ChangePhoneState();
}

class _ChangePhoneState extends BaseState<ChangePhone> {
  InputBorder enabled;
  InputBorder focused;
  String phone = "";

  @override
  String appBarTitle() => TextConstants.CHANGE_PHONE;

  @override
  Widget body() {
    return ChangeBody(
        label: TextConstants.PROFILE_PHONE_LABEL,
        onChanged: (phoneText) {
          phone = phoneText;
        }
    );
  }

  @override
  EdgeInsetsGeometry padding() => context.mediumEdgeInsetsSymmetric;
}
