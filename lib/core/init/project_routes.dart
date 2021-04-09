import 'package:piton_taxi_app/screens/home/view/homepage.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:piton_taxi_app/book_late_pick_date.dart';
import 'package:piton_taxi_app/emergency_contact.dart';
import 'package:piton_taxi_app/help_support.dart';
import 'package:piton_taxi_app/my_trips.dart';
import 'package:piton_taxi_app/screens/profile/view/profile.dart';
import 'package:piton_taxi_app/rate_card.dart';
import 'package:piton_taxi_app/screens/menu/view/menu.dart';
import 'package:piton_taxi_app/news_offers.dart';
import 'package:piton_taxi_app/screens/splash/view/splash.dart';
import 'package:piton_taxi_app/screens/payment/view/payment_menu.dart';
import '../../screens/login/view/login.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/screens/profile/view/change_name_surname.dart';
import 'package:piton_taxi_app/screens/profile/view/change_email.dart';
import 'package:piton_taxi_app/screens/profile/view/change_phone.dart';
import 'package:piton_taxi_app/screens/payment/view/registered_cards.dart';
import 'package:piton_taxi_app/screens/payment/view/payment_points.dart';

class ProjectRoute{
  static dynamic generatePageRoute(Pages settings, {dynamic variable}){
    switch (settings){
      case Pages.SPLASH:
        return Splash();
      case Pages.LOGIN:
        return Login(transitionAnimation: variable);
      case Pages.HOME:
        return HomePage();
      case Pages.MENU:
        return Menu();
      case Pages.PROFILE:
        return Profile();
      case Pages.PAYMENT_MENU:
        return PaymentMenu();
      case Pages.BOOK_LATER:
        return BookLaterDatePicker();
      case Pages.MY_TRIPS:
        return MyTrips();
      case Pages.RATE_CARD:
        return RateCard();
      case Pages.EMERGENCY_CONTACTS:
        return EmergencyContacts();
      case Pages.HELP_SUPPORT:
        return HelpSupport();
      case Pages.NEWS_OFFERS:
        return NewsOffers();
      case Pages.CHANGE_NAME_SURNAME:
        return ChangeNameSurname();
      case Pages.CHANGE_EMAIL:
        return ChangeEmail();
      case Pages.CHANGE_PHONE:
        return ChangePhone();
      case Pages.REGISTERED_CARDS:
        return RegisteredCards();
      case Pages.PAYMENT_POINTS:
        return PaymentPoints();
    }
  }

  static MaterialPageRoute<dynamic> generateMaterialPageRoute(Pages settings){
    return MaterialPageRoute(builder: (_) => generatePageRoute(settings));
  }

  static PageRouteBuilder<dynamic> generateSlidePageRouteBuilder(Pages settings, int duration){
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => generatePageRoute(settings, variable: animation),
        transitionDuration: Duration(milliseconds: duration),
        transitionsBuilder: (context, animation, secondaryAnimation, child){
          return SlideTransition(position: animation.drive(Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero)), child: child,);
        }
    );
  }
}