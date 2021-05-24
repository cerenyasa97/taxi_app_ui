import 'package:piton_taxi_app/core/constants/dummy_data/dummy_data.dart';
import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/base/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'change_body.dart';

class ChangeNameSurname extends BaseView {
  ChangeNameSurname({Key key}) : super(key: key);

  @override
  _ChangeNameSurnameState createState() => _ChangeNameSurnameState();
}

class _ChangeNameSurnameState extends BaseState<ChangeNameSurname> {
  @override
  String appBarTitle() => LocaleKeys.profile_update_nameSurname;

  @override
  Widget body() {
    return ChangeBody(
      label: LocaleKeys.profile_contactInformation_nameSurnameLabel,
      hint: LocaleKeys.profile_update_hintNameSurname,
      onChanged: (nameSurnameText) {
        DummyData.user_1.nameSurname = nameSurnameText;
      }
    );
  }

  @override
  EdgeInsetsGeometry padding() => context.mediumEdgeInsetsSymmetric;
}
