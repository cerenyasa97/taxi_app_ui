import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';

class FacebookLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dynamicWidth(50),
      height: context.dynamicWidth(50),
      child: Image.asset(ImageConstants.FACEBOOK_LOGIN_IMAGE, fit: BoxFit.fill,),
    );
  }
}
