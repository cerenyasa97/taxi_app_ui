import 'package:flutter/material.dart';
import 'package:piton_taxi_app/home/home.dart';
import 'package:piton_taxi_app/screens/splash/view/splash.dart';

import '../../screens/login/view/login.dart';

class ProjectRoute{
  static dynamic generatePageRoute(String settings, dynamic variable){
    switch (settings){
      case '/':
        return Splash();
      case '/login':
        return Login(transitionAnimation: variable);
      case '/home':
        return Home();
    }
  }

  static MaterialPageRoute<dynamic> generateMaterialPageRoute(String settings){
    return MaterialPageRoute(builder: (_) => generatePageRoute(settings, null));
  }

  static PageRouteBuilder<dynamic> generateSlidePageRouteBuilder(String settings){
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => generatePageRoute(settings, animation),
        transitionDuration: Duration(seconds: 1),
        transitionsBuilder: (context, animation, secondaryAnimation, child){
          return SlideTransition(position: animation.drive(Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero)), child: child,);
        }
    );
  }
}