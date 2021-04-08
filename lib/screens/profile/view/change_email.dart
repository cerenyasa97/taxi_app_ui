import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/base/view/base_view.dart';
import 'package:flutter/material.dart';
import 'change_body.dart';

class ChangeEmail extends BaseView {
  ChangeEmail({Key key}) : super(key: key);

  @override
  _ChangeEmailState createState() => _ChangeEmailState();
}

class _ChangeEmailState extends BaseState<ChangeEmail> {
  InputBorder enabled;
  InputBorder focused;
  String email = "";

  @override
  String appBarTitle() => TextConstants.CHANGE_EMAIL;

  @override
  Widget body() {
    return ChangeBody(
        label: TextConstants.PROFILE_EMAIL_LABEL,
        onChanged: (emailText) {
          email = emailText;
        }
    );
  }

  @override
  EdgeInsetsGeometry padding() => context.mediumEdgeInsetsSymmetric;
}
