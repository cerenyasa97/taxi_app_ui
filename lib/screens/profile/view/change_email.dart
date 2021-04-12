import 'package:piton_taxi_app/core/constants/dummy_data.dart';
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

  @override
  String appBarTitle() => TextConstants.CHANGE_EMAIL;

  @override
  Widget body() {
    return ChangeBody(
      keyboardType: TextInputType.emailAddress,
        label: TextConstants.PROFILE_EMAIL_LABEL,
        onChanged: (emailText) {
           DummyData.user_1.email = emailText;
        }
    );
  }

  @override
  EdgeInsetsGeometry padding() => context.mediumEdgeInsetsSymmetric;
}
