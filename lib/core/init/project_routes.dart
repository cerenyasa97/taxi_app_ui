import 'pages_import.dart';

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
        return BookLater();
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