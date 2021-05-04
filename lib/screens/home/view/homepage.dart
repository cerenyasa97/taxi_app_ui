import 'package:piton_taxi_app/screens/home/utils/google_map_provider.dart';
import 'package:piton_taxi_app/screens/home/view/google_map_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'trip_description_panel/trip_description.dart';
import 'homapage_body.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Consumer<GoogleMapProvider>(
          builder: (context, mapModel, child){
            return Stack(
              children: [
                GoogleMapBackground(),
                HomePageBody(),
                Visibility(child: TripDescription(), visible: mapModel.polylineSet.isNotEmpty,),
              ],
            );
          },
        ),
    );
  }
}
