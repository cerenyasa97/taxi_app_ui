import 'package:piton_taxi_app/core/components/container/white_container_with_shadow.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/components/button/project_circular_button.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/core/extensions/context/sized_box_extension.dart';
import 'package:piton_taxi_app/core/constants/enums/trip_status.dart';
import 'package:piton_taxi_app/core/extensions/theme/theme_extension.dart';
import 'package:piton_taxi_app/core/constants/enums/payments.dart';
import 'package:piton_taxi_app/core/components/image/project_image.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/core/extensions/maps/maps_extension.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:piton_taxi_app/core/init/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'trip_bill.dart';

// ignore: must_be_immutable
class TripEndDetail extends StatefulWidget {
  TripEndDetail({Key key}) : super(key: key);

  @override
  _TripEndDetailState createState() => _TripEndDetailState();
}

class _TripEndDetailState extends State<TripEndDetail> {
  TextStyle descriptionStyle;

  TextStyle yellowStyle;

  @override
  Widget build(BuildContext context) {
    descriptionStyle =
        context.textTheme.subtitle2.copyWith(color: Colors.black54);
    yellowStyle =
        context.textTheme.headline2.copyWith(color: Colors.amber, fontSize: 35);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: context.dynamicWidth(340),
          child: ProjectTextLocale(
            text: LocaleKeys.payment_title,
            style: descriptionStyle,
          ),
        ),
        WhiteContainerWithShadow(
            width: context.dynamicWidth(360),
            height: context.dynamicHeight(70),
            child: TripBill()
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _getPaymentButtons(() {
              context.mapProvider.changeTripStatus(TripStatus.TRIP_PAYMENT);
              context.mapProvider.changePaymentStatus(Payments.WALLET);
            }, ImageConstants.PAYMENT_WALLET, LocaleKeys.payment_walletLabel),
            _getPaymentButtons(() {
              context.mapProvider.changeTripStatus(TripStatus.TRIP_PAYMENT);
              context.mapProvider.changePaymentStatus(Payments.CARD);
            }, ImageConstants.PAYMENT_CARD, LocaleKeys.payment_card),
            _getPaymentButtons(() {
              context.mapProvider.changePaymentStatus(Payments.CASH);
              _navigateToComment();
            },
                ImageConstants.PAYMENT_CASH, LocaleKeys.payment_cash),
          ],
        )
      ],
    );
  }

  Widget _getPaymentButtons(Function() onPressed, String image, String title) {
    return Column(
      children: [
        ProjectCircularButton(
          onPressed: onPressed,
          child: ProjectImage(
            imagePath: image,
            width: 35,
          ),
          color: Colors.white,
        ),
        context.lowestSizedBoxHeight,
        ProjectTextLocale(
          text: title,
          style: descriptionStyle,
        )
      ],
    );
  }

  _navigateToComment() {
    context.mapProvider.changeTripStatus(TripStatus.BEFORE_TRIP);
    NavigationService.instance.navigatorPushSlidePage(context, Pages.PAYMENT_DONE);
  }
}