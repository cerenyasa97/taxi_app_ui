import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/painting/edge_insets.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:piton_taxi_app/core/base/view/base_view.dart';
import '../../../core/constants/app/constants.dart';
import '../../../core/constants/images/image_constants.dart';
import '../../../core/constants/text/text_constants.dart';
import '../../../core/init/project_routes.dart';
import '../../../widgets/custom_list_tile.dart';

class PaymentMenu extends BaseView{

  PaymentMenu({Key key}) : super(key: key);

  @override
  _PaymentMenuState createState() => _PaymentMenuState();

}

class _PaymentMenuState extends BaseState<PaymentMenu>{
  @override
  String appBarTitle() => TextConstants.PAYMENT_MENU_TITLE;

  @override
  Widget body() {
    return ListView(
      children: [
        CustomListTile(title: TextConstants.PAYMENT_CASH, imagePath: ImageConstants.PAYMENT_CASH, onTap: () => Navigator.of(context).pushReplacement(ProjectRoute.generateSlidePageRouteBuilder(Pages.HOME, ProjectConstants.FAST_PAGE_TRANSITION_DURATION)),),
        context.lowSizedBoxHeight,
        CustomListTile(title: TextConstants.PAYMENT_CARD, imagePath: ImageConstants.PAYMENT_CARD, onTap: () => _pageNavigation(Pages.REGISTERED_CARDS),),
        context.lowSizedBoxHeight,
        CustomListTile(title: TextConstants.PAYMENT_POINTS, imagePath: ImageConstants.PAYMENT_POINTS, onTap: () => _pageNavigation(Pages.PAYMENT_POINTS),),
      ],
    );/*
      Card(
      child:
    );*/
  }

  @override
  EdgeInsetsGeometry padding() => context.mediumEdgeInsetsSymmetric;

  _pageNavigation(Pages page) => Navigator.of(context).push(ProjectRoute.generateSlidePageRouteBuilder(page, ProjectConstants.FAST_PAGE_TRANSITION_DURATION));
}