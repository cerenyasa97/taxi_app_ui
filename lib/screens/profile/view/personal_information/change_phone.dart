import 'package:piton_taxi_app/core/constants/dummy_data/dummy_data.dart';
import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/base/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'change_body.dart';

class ChangePhone extends BaseView {
  ChangePhone({Key key}) : super(key: key);

  @override
  _ChangePhoneState createState() => _ChangePhoneState();
}

class _ChangePhoneState extends BaseState<ChangePhone> {
  @override
  String appBarTitle() => LocaleKeys.profile_update_phone;

  @override
  Widget body() {
    return ChangeBody(
      keyboardType: TextInputType.phone,
        label: LocaleKeys.profile_contactInformation_phoneLabel,
        hint: LocaleKeys.profile_update_hintPhone,
        onChanged: (phoneText) {
          DummyData.user_1.phoneNumber = phoneText;
        }
    );
  }

  @override
  EdgeInsetsGeometry padding() => context.mediumEdgeInsetsSymmetric;
}
