import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/core/base/view/base_view.dart';
import 'package:piton_taxi_app/core/init/project_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'profile_body.dart';

class Profile extends BaseView{
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends BaseState<Profile>{
  @override
  String appBarTitle() => TextConstants.PROFILE_TITLE;

  @override
  Widget body() {
    return Padding(
        padding: context.lowEdgeInsetsAll,
        child: SingleChildScrollView(
        child: ProfileBody(),
    ));
  }

  @override
  EdgeInsetsGeometry padding() => EdgeInsets.zero;
}