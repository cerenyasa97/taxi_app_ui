import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/screens/login/view/country_code_widget.dart';
import 'package:piton_taxi_app/core/extensions/context/divider_extension.dart';
import 'package:piton_taxi_app/widgets/general/phone_number_widget.dart';

class GetPhoneNumber extends StatefulWidget {
  final Function(String) onChanged;
  final double width;

  GetPhoneNumber({Key key, this.onChanged, this.width}) : super(key: key);

  @override
  _GetPhoneNumberState createState() => _GetPhoneNumberState();
}

class _GetPhoneNumberState extends State<GetPhoneNumber> {
  final FocusNode phoneNode = FocusNode();
  Color borderColor = Colors.grey.shade400;
  String countryCode = LocaleKeys.login_initialCountryCode;
  String phoneNumber;
  bool validation = false;

  @override
  void initState() {
    super.initState();
    phoneNode.addListener(() => phoneNode.hasFocus
        ? borderColor = Colors.amber
        : borderColor = Colors.grey.shade400);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dynamicWidth(widget.width ?? 320),
      height: context.dynamicHeight(60),
      decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 1.5),
          borderRadius:
              BorderRadius.circular(ProjectConstants.TEXT_FIELD_BORDER_RADIUS)),
      child: Row(
        children: [
          CountryCodeWidget(
            onChanged: (code) {
              this.countryCode = code.dialCode;
            },
          ),
          context.greyThinVerticalDivider,
          PhoneNumberWidget(
            onSaved: (text) {
              context.closeKeyboard();
            },
            fNode: phoneNode,
            onChanged: (phoneNumber) {
              this.phoneNumber = phoneNumber;
              widget.onChanged(countryCode + phoneNumber);
            },
            validator: (validate) {
              validation = validate ?? false;
            },
          )
        ],
      ),
    );
  }
}
