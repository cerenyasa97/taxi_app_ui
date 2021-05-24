import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/extensions/context/sized_box_extension.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:piton_taxi_app/core/base/view/base_view.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/core/init/navigation/navigation_service.dart';
import 'package:piton_taxi_app/widgets/list_tile/custom_list_tile.dart';
import 'package:flutter/material.dart';

class PaymentMenu extends BaseView {
  PaymentMenu({Key key}) : super(key: key);

  @override
  _PaymentMenuState createState() => _PaymentMenuState();
}

class _PaymentMenuState extends BaseState<PaymentMenu> {
  @override
  String appBarTitle() => LocaleKeys.payment_title;

  @override
  Widget body() {
    return ListView(
      children: [
        CustomListTile(
          title: LocaleKeys.payment_walletLabel,
          imagePath: ImageConstants.PAYMENT_CASH,
          onTap: () => _pageNavigation(Pages.WALLET),
        ),
        context.lowSizedBoxHeight,
        CustomListTile(
          title: LocaleKeys.payment_card,
          imagePath: ImageConstants.PAYMENT_CARD,
          onTap: () => _pageNavigation(Pages.REGISTERED_CARDS),
        ),
      ],
    );
  }

  @override
  EdgeInsetsGeometry padding() => context.mediumEdgeInsetsSymmetric;

  _pageNavigation(Pages page) =>
      NavigationService.instance.navigatorPushSlidePage(context, page);
}
