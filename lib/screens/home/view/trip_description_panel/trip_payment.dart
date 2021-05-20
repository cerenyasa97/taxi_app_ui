import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/init/navigation/pages_import.dart';
import 'package:piton_taxi_app/screens/payment/view/credit_card_payment.dart';
import 'package:piton_taxi_app/screens/home/utils/google_map_provider.dart';
import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/constants/enums/payments.dart';
import 'package:piton_taxi_app/screens/payment/view/wallet_payment.dart';
import 'package:piton_taxi_app/widgets/sliding_up_panel/trip_sliding_up_panel.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'trip_bill.dart';

class TripPayment extends StatelessWidget {
  const TripPayment({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TripSlidingUpPanel(
      maxHeight: context.dynamicHeight(320),
      minHeight: context.dynamicHeight(30),
      panel: Padding(
        padding: context.topEdgeInsets,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: TripBill(),
              flex: 1,
            ),
            Flexible(
              child: Container(
                padding: context.lowEdgeInsetsAll,
                height: context.dynamicHeight(215),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x29000000),
                        offset: Offset(0, 3),
                        blurRadius: 6,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(context.dynamicWidth(30)),
                        topRight: Radius.circular(context.dynamicWidth(30)))),
                child: Consumer<GoogleMapProvider>(
                  builder: (context, mapModel, child) {
                    switch (mapModel.paymentStatus) {
                      case Payments.CARD:
                        return CreditCardPayment();
                      case Payments.WALLET:
                        return WalletPayment();
                      default:
                        return Container();
                    }
                  },
                ),
              ),
              flex: 5,
            )
          ],
        ),
      ),
    );
  }
}
