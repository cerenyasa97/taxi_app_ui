import 'package:piton_taxi_app/core/constants/constants.dart';
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
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(context.dynamicWidth(10/412)),
      ),
      child: CountryCodePicker(
        initialSelection: initialCountryCodeText,
        favorite: favoriteCountiesCodeTexts,
        showCountryOnly: true,
        flagWidth: 28,
        backgroundColor: Colors.grey,
        onChanged: onChanged,
      ),
    );
  }
}
