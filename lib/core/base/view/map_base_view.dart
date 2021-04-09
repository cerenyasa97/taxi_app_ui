import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/core/init/pages_import.dart';
import 'package:piton_taxi_app/core/init/project_theme.dart';
import 'package:provider/provider.dart';

import '../../../screens/home/view/google_map_background.dart';
import '../../../screens/home/view/homapage_body.dart';
import '../../constants/app/constants.dart';
import '../../constants/app/constants.dart';

abstract class MapBaseView extends StatefulWidget {
  MapBaseView({Key key}) : super(key: key);
}

abstract class MapBaseState<Page extends MapBaseView> extends State<Page> {
  Completer<GoogleMapController> _controller = Completer();

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
}
