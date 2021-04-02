import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/widgets/error_alert_dialog.dart';
import 'package:piton_taxi_app/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'phone_number_widget.dart';
import 'country_code_widget.dart';
import 'facebook_login.dart';
import 'otp_code_body.dart';
import 'gmail_login.dart';
import '../../../widgets/next_page.dart';

// ignore: must_be_immutable
class LoginCardBody extends StatelessWidget {
  String _countryCode = initialCountryCode;
  String _phoneNumber;
  bool _validation = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ProjectText(
          text: loginInstructionText,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CountryCodeWidget(
              onChanged: (code) {
                _countryCode = code.dialCode;
              },
            ),
            PhoneNumberWidget(
              onChanged: (phoneNumber) {
                _phoneNumber = phoneNumber;
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
        builder: (context) => _validation ? OtpCodeDialog() : ErrorAlertDialog());
  }
}
