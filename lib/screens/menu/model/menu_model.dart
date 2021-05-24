import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';

class MenuModel{
  String title;
  String image;
  Pages page;

  MenuModel({this.title, this.image, this.page});

  static List<MenuModel> _menuList = [
    MenuModel(title: LocaleKeys.profile_title, image: ImageConstants.MENU_PROFILE, page: Pages.PROFILE),
    MenuModel(title: LocaleKeys.payment_title, image: ImageConstants.MENU_PAYMENT, page: Pages.PAYMENT_MENU),
    MenuModel(title: LocaleKeys.trips_title, image: ImageConstants.MENU_MY_TRIPS, page: Pages.TRIPS),
    MenuModel(title: LocaleKeys.helpSupport_title, image: ImageConstants.MENU_HELP_SUPPORT, page: Pages.HELP_SUPPORT)];

  static List<MenuModel> get menuList => _menuList;

  @override
  String toString() {
    return 'Menu{title: $title, image: $image, page: $page}';
  }

  static int getMenuListLength(){
    return menuList.length;
  }
}
/*
 MenuModel(title: TextConstants.MENU_EMERGENCY_CONTACTS, image: ImageConstants.MENU_EMERGENCY_CONTACTS, page: Pages.EMERGENCY_CONTACTS),
 */