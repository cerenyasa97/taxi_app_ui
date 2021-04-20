import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/core/init/project_theme.dart';
import 'package:provider/provider.dart';

abstract class BaseView extends StatefulWidget {
  BaseView({Key key}) : super(key: key);
}

abstract class BaseState<Page extends BaseView> extends State<Page> {
  String appBarTitle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton(),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: ProjectText(
          text: appBarTitle(),
          style: Provider.of<ProjectThemeData>(context)
              .getThemeData
              .textTheme
              .subtitle2,
        ),
      ),
      body: Container(
        padding: padding(),
        child: body(),
      ),
    );
  }

  Widget body();

  EdgeInsetsGeometry padding();

  FloatingActionButton floatingActionButton() => null;
}
