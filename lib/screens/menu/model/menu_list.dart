import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:piton_taxi_app/screens/menu/model/menu_model.dart';

class MenuList{
  List<Menu> menu = [];
  
  MenuList(){
    menu.add(Menu(TextConstants.MENU_PROFILE, ImageConstants.MENU_PROFILE, Pages.PROFILE));
    menu.add(Menu(TextConstants.MENU_PAYMENT, ImageConstants.MENU_PAYMENT, Pages.PAYMENT_MENU));
    menu.add(Menu(TextConstants.MENU_BOOK_LATER, ImageConstants.MENU_BOOK_LATER, Pages.BOOK_LATER));
    menu.add(Menu(TextConstants.MENU_MY_TRIPS, ImageConstants.MENU_MY_TRIPS, Pages.TRIPS));
    menu.add(Menu(TextConstants.MENU_RATE_CARD, ImageConstants.MENU_RATE_CARD, Pages.RATE_CARD));
    menu.add(Menu(TextConstants.MENU_EMERGENCY_CONTACTS, ImageConstants.MENU_EMERGENCY_CONTACTS, Pages.EMERGENCY_CONTACTS));
    menu.add(Menu(TextConstants.MENU_HELP_SUPPORT, ImageConstants.MENU_HELP_SUPPORT, Pages.HELP_SUPPORT));
  }

  int getMenuListLength(){
    return menu.length;
  }
}