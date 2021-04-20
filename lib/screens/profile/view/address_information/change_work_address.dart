import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/constants/dummy_data/dummy_data.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/screens/profile/view/change_body.dart';
import 'package:piton_taxi_app/core/base/view/base_view.dart';
import 'package:flutter/material.dart';

class ChangeWorkAddress extends BaseView{
  @override
  _ChangeWorkAddressState createState() => _ChangeWorkAddressState();
}

class _ChangeWorkAddressState extends BaseState<ChangeWorkAddress>{
  @override
  String appBarTitle() => TextConstants.ADDRESSES_WORK;

  @override
  Widget body() {
    return ChangeBody(
        label: TextConstants.ADDRESSES_WORK,
        onChanged: (workAddress) {
          DummyData.user_1.workAddress = workAddress;
        }
    );
  }

  @override
  EdgeInsetsGeometry padding() => context.mediumEdgeInsetsSymmetric;
}