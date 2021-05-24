import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/core/extensions/theme/theme_extension.dart';

abstract class BaseView extends StatefulWidget {
  BaseView({Key key}) : super(key: key);
}

abstract class BaseState<Page extends BaseView> extends State<Page> {
  String appBarTitle() => null;

  AppBar appBar() => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: floatingActionButton(),
      appBar: appBar() ?? AppBar(
        centerTitle: true,
        title: ProjectTextLocale(
          text: appBarTitle() ?? "Title",
          style: context
              .textTheme
              .subtitle2,
        ),
      ),
      body: Container(
        height: context.height,
        width: context.width,
        padding: padding(),
        child: body(),
      ),
    );
  }

  Widget body();

  EdgeInsetsGeometry padding();

  FloatingActionButton floatingActionButton() => null;
}
