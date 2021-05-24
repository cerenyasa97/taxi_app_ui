import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:flutter/material.dart';

class GmailLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dynamicWidth(50),
      height: context.dynamicWidth(50),
      child: Image.asset(ImageConstants.GOOGLE_LOGIN_ICON, fit: BoxFit.fill,),
    );
  }
}
