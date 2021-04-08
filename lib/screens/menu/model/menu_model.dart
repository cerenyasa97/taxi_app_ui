import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:piton_taxi_app/core/init/project_routes.dart';

class Menu{
  String title;
  String image;
  Pages page;

  Menu(this.title, this.image, this.page);

  @override
  String toString() {
    return 'Menu{title: $title, image: $image, page: $page}';
  }
}