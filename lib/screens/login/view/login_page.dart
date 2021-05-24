import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/core/init/navigation/navigation_service.dart';
import 'package:piton_taxi_app/widgets/general/get_phone_number.dart';
import 'package:piton_taxi_app/core/extensions/context/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/widgets/buttons/amber_button.dart';
import 'login_base.dart';
import 'facebook_login.dart';
import 'gmail_login.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginBase(
        title: LocaleKeys.login_title,
        description: LocaleKeys.login_instruction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GetPhoneNumber(
              onChanged: (text) {},
            ),
            AmberButton(
              width: context.dynamicWidth(200),
              onPressed: () =>
                  NavigationService.instance
                      .navigatorPushAndRemoveUntil(
                      context,
                      Pages.PERSONAL_INFORMATION,),
              //_showOTPDialog(context),
              text: LocaleKeys.button_labels_save,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FacebookLogin(),
                context.lowSizedBoxWidth,
                GmailLogin(),
              ],
            ),
          ],
        ));
  }
}