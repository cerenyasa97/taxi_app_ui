import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';

class MenuModel{
  String title;
  String image;
  Pages page;

  MenuModel({this.title, this.image, this.page});

  static List<MenuModel> _menuList = [MenuModel(title: TextConstants.MENU_PROFILE, image: ImageConstants.MENU_PROFILE, page: Pages.PROFILE),
    MenuModel(title: TextConstants.MENU_PAYMENT, image: ImageConstants.MENU_PAYMENT, page: Pages.PAYMENT_MENU),
    MenuModel(title: TextConstants.MENU_BOOK_LATER, image: ImageConstants.MENU_BOOK_LATER, page: Pages.BOOK_LATER),
    MenuModel(title: TextConstants.MENU_MY_TRIPS, image: ImageConstants.MENU_MY_TRIPS, page: Pages.TRIPS),
    MenuModel(title: TextConstants.MENU_RATE_CARD, image: ImageConstants.MENU_RATE_CARD, page: Pages.RATE_CARD),
    MenuModel(title: TextConstants.MENU_EMERGENCY_CONTACTS, image: ImageConstants.MENU_EMERGENCY_CONTACTS, page: Pages.EMERGENCY_CONTACTS),
    MenuModel(title: TextConstants.MENU_HELP_SUPPORT, image: ImageConstants.MENU_HELP_SUPPORT, page: Pages.HELP_SUPPORT)];

  static List<MenuModel> get menuList => _menuList;

  @override
  String toString() {
    return 'Menu{title: $title, image: $image, page: $page}';
  }

  static int getMenuListLength(){
    return menuList.length;
  }
}