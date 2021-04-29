import 'pages_import.dart';

class ProjectRoute{
  static dynamic generatePageRoute(Pages settings, {dynamic animation, var variable}){
    switch (settings){
      case Pages.SPLASH:
        return Splash();
      case Pages.LOGIN:
        return Login(transitionAnimation: animation);
      case Pages.HOME:
        return HomePage();
      case Pages.MENU:
        return Menu();
      case Pages.PROFILE:
        return Profile();
      case Pages.PAYMENT_MENU:
        return PaymentMenu();
      case Pages.BOOK_LATER:
        return BookLater();
      case Pages.TRIPS:
        return Trips();
      case Pages.RATE_CARD:
        return RateCard();
      case Pages.EMERGENCY_CONTACTS:
        return EmergencyContacts();
      case Pages.HELP_SUPPORT:
        return HelpSupport();
      case Pages.NOTIFICATIONS:
        return TaxiNotifications();
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
      case Pages.TRIP_DETAIL:
        return TripDetail(trip: variable);
      case Pages.ADDRESS:
        return UserAddress();
      case Pages.CHANGE_HOME_ADDRESS:
        return ChangeHomeAddress();
      case Pages.CHANGE_WORK_ADDRESS:
        return ChangeWorkAddress();
      case Pages.ADD_ANOTHER_ADDRESS:
        return AddAnotherAddress(variable);
      case Pages.ADD_CARD:
        return AddCreditCard();
      case Pages.SEARCH_LOCATION:
        return SearchLocation(variable);
    }
  }

  static MaterialPageRoute<dynamic> generateMaterialPageRoute(Pages settings){
    return MaterialPageRoute(builder: (_) => generatePageRoute(settings));
  }

  static PageRouteBuilder<dynamic> generateSlidePageRouteBuilder(Pages settings, int duration, {var variable}){
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => generatePageRoute(settings, animation: animation, variable: variable),
        transitionDuration: Duration(milliseconds: duration),
        transitionsBuilder: (context, animation, secondaryAnimation, child){
          return SlideTransition(position: animation.drive(Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero)), child: child,);
        }
    );
  }
}