import 'package:piton_taxi_app/screens/search_location/view/search_location.dart';
import 'package:piton_taxi_app/core/components/project_text_field.dart';
import 'package:flutter/material.dart';

class AddressTextField extends StatelessWidget {

  final GlobalKey<SearchLocationState> searchLocationKey;

  AddressTextField({Key key, this.searchLocationKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProjectTextField(
      controller: searchLocationKey.currentState.controller,
      onChanged: (text) {
        if(text.length > 1) searchLocationKey.currentState.model.autocompleteAddress(text);
      },
      onSubmitted: (text) => FocusScope.of(context).requestFocus(FocusNode()),
    );
  }
}
