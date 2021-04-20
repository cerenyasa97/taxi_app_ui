import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/widgets/error_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'phone_number_widget.dart';
import 'country_code_widget.dart';
import 'facebook_login.dart';
import 'otp_code_body.dart';
import 'gmail_login.dart';
import '../../../widgets/next_page.dart';

// ignore: must_be_immutable
class LoginCardBody extends StatelessWidget {
  String countryCode = TextConstants.INITIAL_COUNTRY_CODE;
  String phoneNumber;
  bool _validation = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: context.mediumHorizontalEdgeInsets,
          child: ProjectText(
            text: TextConstants.LOGIN_INSTRUCTION_TEXT,
            style: Theme.of(context).textTheme.bodyText2,
            align: TextAlign.center,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CountryCodeWidget(
              onChanged: (code) {
                this.countryCode = code.dialCode;
              },
            ),
            PhoneNumberWidget(
              onChanged: (phoneNumber) {
                this.phoneNumber = phoneNumber;
              },
              validator: (validate) {
                _validation = validate ?? false;
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FacebookLogin(),
            GmailLogin(),
            NextPage(
              onTap: () {
                debugPrint(_validation.toString());
                _showOTPDialog(context);
              },
            ),
          ],
        )
      ],
    );
  }

  Future<void> _showOTPDialog(BuildContext context) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) =>
            _validation ? OtpCodeDialog() : ErrorAlertDialog(title: TextConstants.GET_WARNING_TITLE, contentText: TextConstants.PHONE_VERIFICATION_FIELD_ERROR));
  }
}
