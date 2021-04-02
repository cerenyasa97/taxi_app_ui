import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/Ceren/Desktop/piton_taxi_app/lib/core/constants/constants.dart';
import 'package:piton_taxi_app/menu/menu.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';

import '../news_offers.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _currentLocation = LatLng(39.7467754, 30.471961);
  Set<Marker> markers = new Set();

  GoogleMapController mapController;
  BitmapDescriptor bitmapDescriptor;
  String _from, _to;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(), "images/map-marker.png")
        .then((bitmap) {
      bitmapDescriptor = bitmap;
    });
    markers.add(Marker(
        markerId: MarkerId("ahmedabad"),
        position: _currentLocation,
        icon: bitmapDescriptor));
  }

  void _onMapCreated(GoogleMapController mapController) {
    this.mapController = mapController;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(Colors.amber.toString());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Builder(
          builder: (context) {
            return Container(
                child: Stack(children: <Widget>[
              GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: _currentLocation, zoom: 14),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                markers: markers,
                onMapCreated: _onMapCreated,
              ),
              Positioned(
                  top: 50,
                  left: 20,
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      color: const Color(0xffffffff),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x47000000),
                          offset: Offset(0, 3),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.blueGrey,
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Menu();
                            });
                      },
                    ),
                  )),
              Positioned(
                  top: 50,
                  right: 20,
                  child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        color: const Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x47000000),
                            offset: Offset(0, 3),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: IconButton(
                          icon: Icon(
                            Icons.notification_important_outlined,
                            color: Colors.blueGrey,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (context) => NewsOffers()));
                          }))),
              Positioned(
                top: context.dynamicHeight(0.15),
                left: context.dynamicWidth(0.05),
                child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.dynamicWidth(0.02)),
                    width: context.dynamicWidth(0.90),
                    height: context.dynamicHeight(0.15),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(context.dynamicWidth(0.04)),
                      color: const Color(0xffffffff),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x29000000),
                          offset: Offset(0, 3),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          flex: 10,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: context.dynamicWidth(0.015)),
                            child: SvgPicture.asset(routeIcon),
                          ),
                        ),
                        Flexible(
                          child: Container(),
                          flex: 5,
                        ),
                        Flexible(
                          flex: 85,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                    elevation: MaterialStateProperty.all(0),
                                  ),
                                  child:                               Container(
                                      width: double.infinity,
                                      child: Text(
                                        _from ?? "Where from...",
                                        style: TextStyle(color: Colors.blueGrey),
                                        textAlign: TextAlign.start,
                                      )
                                  ),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return _getAlertDialog("Where from");
                                        });
                                  }),
                              Divider(
                                height: context.dynamicHeight(3 / 870),
                              ),
                              ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                    elevation: MaterialStateProperty.all(0),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    child: Text(_to ?? "Where to...",
                                        style: TextStyle(color: Colors.blueGrey)),
                                  ),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return _getAlertDialog("Where to");
                                        });
                                  }),

                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ]));
          },
        ),
      ),
    );
  }

  _getAlertDialog(String title) {
    return AlertDialog(
      title: Text(title),
      content: TextField(
        onChanged: (text) {
          title == "Where from" ? _from = text : _to = text;
        },
        decoration: InputDecoration(
            hintText: "Enter location",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
            suffixIcon: IconButton(
              icon: Icon(Icons.search, color: Colors.amber),
              onPressed: () => Navigator.of(context).pop(""),
            )),
      ),
      actions: [
        _getDialogButton(Icons.location_on_outlined, "Current Location"),
        _getDialogButton(Icons.home, "Home"),
        _getDialogButton(Icons.home_work_outlined, "Work"),
      ],
    );
  }

  _getDialogButton(IconData icon, String tooltip) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Container(
        width: context.dynamicWidth(0.1214),
        height: context.dynamicWidth(0.1214),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
          color: Colors.amber,
          boxShadow: [
            BoxShadow(
              color: const Color(0x47000000),
              offset: Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: IconButton(
          icon: Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          tooltip: tooltip,
        ),
      ),
    );
  }
}
