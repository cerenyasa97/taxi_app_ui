import 'package:piton_taxi_app/screens/home/view/google_map_background.dart';
import 'package:flutter/material.dart';
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
        body: Stack(
          children: [
            GoogleMapBackground(),
            HomePageBody()
          ],
        ),
    );
  }
}
