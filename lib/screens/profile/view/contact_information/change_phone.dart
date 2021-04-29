import 'file:///C:/Users/Ceren/Desktop/piton_taxi_app/lib/core/constants/dummy_data/dummy_data.dart';
import 'package:piton_taxi_app/core/extensions/edge_insets_extension.dart';
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
  @override
  String appBarTitle() => TextConstants.CHANGE_PHONE;

  @override
  Widget body() {
    return ChangeBody(
      keyboardType: TextInputType.phone,
        label: TextConstants.PROFILE_PHONE_LABEL,
        onChanged: (phoneText) {
          DummyData.user_1.phoneNumber = phoneText;
        }
    );
  }

  @override
  EdgeInsetsGeometry padding() => context.mediumEdgeInsetsSymmetric;
}
