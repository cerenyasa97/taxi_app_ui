import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/constants/dummy_data/dummy_data.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/screens/profile/view/change_body.dart';
import 'package:piton_taxi_app/core/base/view/base_view.dart';
import 'package:flutter/material.dart';

class ChangeHomeAddress extends BaseView{
  @override
  _ChangeHomeAddressState createState() => _ChangeHomeAddressState();
}

class _ChangeHomeAddressState extends BaseState<ChangeHomeAddress>{
  @override
  String appBarTitle() => TextConstants.ADDRESSES_HOME;

  @override
  Widget body() {
    return ChangeBody(
        label: TextConstants.ADDRESSES_HOME,
        onChanged: (homeAddress) {
          DummyData.user_1.homeAddress = homeAddress;
        }
    );
  }

  @override
  EdgeInsetsGeometry padding() => context.mediumEdgeInsetsSymmetric;
}