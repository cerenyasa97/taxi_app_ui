import 'file:///C:/Users/Ceren/Desktop/piton_taxi_app/lib/screens/home/view/homepage.dart';
import 'package:piton_taxi_app/menu/menu.dart';
import 'package:piton_taxi_app/news_offers.dart';
import 'package:piton_taxi_app/screens/splash/view/splash.dart';
import '../../screens/login/view/login.dart';
import 'package:flutter/material.dart';

class ProjectRoute{

  static dynamic generatePageRoute(String settings, {dynamic variable}){
    switch (settings){
      case '/':
        return Splash();
      case '/login':
        return Login(transitionAnimation: variable);
      case '/home':
        return HomePage();
      case '/menu':
        return Menu();
      case '/notifications':
        return NewsOffers();
    }
  }

  static MaterialPageRoute<dynamic> generateMaterialPageRoute(String settings){
    return MaterialPageRoute(builder: (_) => generatePageRoute(settings));
  }

  static PageRouteBuilder<dynamic> generateSlidePageRouteBuilder(String settings, int duration){
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => generatePageRoute(settings, variable: animation),
        transitionDuration: Duration(milliseconds: duration),
        transitionsBuilder: (context, animation, secondaryAnimation, child){
          return SlideTransition(position: animation.drive(Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero)), child: child,);
        }
    );
  }
}