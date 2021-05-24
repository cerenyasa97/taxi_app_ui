import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'change_address_body.dart';

class ChangeWorkAddress extends StatelessWidget{
  @override
  Widget build(BuildContext context) => ChangeAddressBody(appBarTitle: LocaleKeys.addresses_workLabel,);
}