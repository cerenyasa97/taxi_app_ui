import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class CountryCodeWidget extends StatelessWidget {

  final Function(CountryCode code) onChanged;

  const CountryCodeWidget({Key key, @required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(context.dynamicWidth(6/412)),
      ),
      child: CountryCodePicker(
        initialSelection: TextConstants.INITIAL_COUNTRY_CODE_TEXT,
        favorite: TextConstants.favoriteCountriesCodeTexts,
        showCountryOnly: true,
        flagWidth: 26,
        backgroundColor: Colors.grey,
        onChanged: onChanged,
      ),
    );
  }
}
