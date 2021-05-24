import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class CountryCodeWidget extends StatelessWidget {

  final Function(CountryCode code) onChanged;

  const CountryCodeWidget({Key key, @required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      initialSelection: TextConstants.favoriteCountriesCodeTexts[0],
      favorite: TextConstants.favoriteCountriesCodeTexts,
      showCountryOnly: true,
      flagWidth: 26,
      backgroundColor: Colors.grey,
      onChanged: onChanged,
    );
  }
}
