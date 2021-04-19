import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:piton_taxi_app/core/init/pages_import.dart';

abstract class MapBaseView extends StatefulWidget {
  MapBaseView({Key key}) : super(key: key);
}

abstract class MapBaseState<Page extends MapBaseView> extends State<Page> {
  String appBarTitle();

  MapType mapType();

  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HomePage(),
          body(),
        ],
      ),
    );
  }

  Widget body();

  EdgeInsetsGeometry padding();
}
