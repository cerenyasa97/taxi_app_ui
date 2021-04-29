import 'package:flutter/material.dart';
import 'package:piton_taxi_app/screens/profile/view/address_information/change_address_body.dart';

class AddAnotherAddress extends StatelessWidget {

  final String title;

  const AddAnotherAddress(this.title);

  @override
  Widget build(BuildContext context) =>  ChangeAddressBody(appBarTitle: title);
}

