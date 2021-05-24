import 'package:piton_taxi_app/core/constants/dummy_data/dummy_data.dart';
import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/base/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'change_body.dart';

class ChangeEmail extends BaseView {
  ChangeEmail({Key key}) : super(key: key);

  @override
  _ChangeEmailState createState() => _ChangeEmailState();
}

class _ChangeEmailState extends BaseState<ChangeEmail> {
  @override
  String appBarTitle() => LocaleKeys.profile_update_email;

  @override
  Widget body() {
    return ChangeBody(
        keyboardType: TextInputType.emailAddress,
        label: LocaleKeys.profile_contactInformation_emailLabel,
        hint: LocaleKeys.profile_update_hintEmail,
        onChanged: (emailText) {
          DummyData.user_1.email = emailText;
        }
    );
  }

  @override
  EdgeInsetsGeometry padding() => context.mediumEdgeInsetsSymmetric;
}