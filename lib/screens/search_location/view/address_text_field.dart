import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/screens/home/utils/google_map_provider.dart';
import 'package:piton_taxi_app/screens/search_location/view/search_location_page.dart';
import 'package:piton_taxi_app/core/components/text_field/project_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressTextField extends StatelessWidget {
  final GlobalKey<SearchLocationState> searchLocationKey;

  AddressTextField({Key key, this.searchLocationKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapProvider = Provider.of<GoogleMapProvider>(context, listen: false);
    return ProjectTextField(
      hintText: LocaleKeys.searchLocation_hintText,
      controller: searchLocationKey.currentState.controller,
      onChanged: (text) {
        if (text.length > 1) mapProvider.autocompleteAddress(text);
      },
      onSubmitted: (text) => context.closeKeyboard(),
    );
  }
}
