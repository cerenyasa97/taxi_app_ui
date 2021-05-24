import 'package:piton_taxi_app/core/components/image/project_image.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/core/extensions/theme/theme_extension.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/extensions/context/sized_box_extension.dart';

class LoginBase extends StatelessWidget {
  final String title;
  final String description;
  final Widget child;

  const LoginBase({Key key, this.title, this.description, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle yellowTextStyle = context.textTheme.headline2.copyWith(
        color: Colors.amber, fontStyle: FontStyle.italic, fontSize: 32);
    final TextStyle bodyTextStyle =
        context.textTheme.headline5.copyWith(color: Colors.grey.shade800);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: context.mediumEdgeInsetsSymmetric,
          child: ListView(
            children: [
              Container(
                height: context.dynamicHeight(300),
                child: Align(
                  child: ProjectImage(
                    imagePath: ImageConstants.LOGIN_VECTOR,
                    width: 325,
                  ),
                  alignment: Alignment.bottomCenter,
                ),
              ),
              context.lowSizedBoxHeight,
              Container(
                  height: context.dynamicHeight(100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProjectTextLocale(text: title, style: yellowTextStyle),
                      ProjectTextLocale(
                        text: description,
                        style: bodyTextStyle,
                        maxLines: 5,
                        align: TextAlign.center,
                      )
                    ],
                  )),
              context.lowSizedBoxHeight,
              Container(
                height: context.dynamicHeight(250),
                child: child,
              )
            ],
          ),
        ));
  }
}
