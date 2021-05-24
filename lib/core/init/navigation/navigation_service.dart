import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:piton_taxi_app/core/init/navigation/pages_import.dart';
import 'package:piton_taxi_app/core/init/navigation/project_routes.dart';

class NavigationService {
  static NavigationService _instance;

  static NavigationService get instance =>
      _instance ??= NavigationService._internal();

  NavigationService._internal();

  navigatorPushSlidePage(BuildContext context, Pages page,
      {int duration = ProjectConstants.FAST_PAGE_TRANSITION_DURATION,
      var variable}) async {
    return await Navigator.of(context).push(
        ProjectRoute.generateSlidePageRouteBuilder(page, duration,
            variable: variable));
  }

  navigatorPushAndRemoveUntil(BuildContext context, Pages page,
      {int duration = ProjectConstants.FAST_PAGE_TRANSITION_DURATION,
      var variable}) async {
    return await Navigator.of(context).pushAndRemoveUntil(
        ProjectRoute.generateSlidePageRouteBuilder(page, duration,
            variable: variable),
        (route) => false);
  }

  navigatorPushReplacement(BuildContext context, Pages page,
          {int duration = ProjectConstants.FAST_PAGE_TRANSITION_DURATION,
          var variable}) =>
      Navigator.of(context).pushReplacement(
          ProjectRoute.generateSlidePageRouteBuilder(page, duration,
              variable: variable));

  navigatorPop(BuildContext context, {var variable}) =>
      Navigator.of(context).pop(variable);
}
