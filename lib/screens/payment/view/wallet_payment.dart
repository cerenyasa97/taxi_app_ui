import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/core/extensions/theme/theme_extension.dart';
import 'package:piton_taxi_app/core/init/navigation/navigation_service.dart';
import 'package:piton_taxi_app/core/init/navigation/project_routes.dart';
import 'package:piton_taxi_app/widgets/general/wallet_detail.dart';

class WalletPayment extends StatelessWidget {
  const WalletPayment({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.dynamicHeight(220),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ProjectTextLocale(
              text: LocaleKeys.payment_walletLabel,
              style:
                  context.textTheme.headline4.copyWith(color: Colors.black87),
            ),
            Stack(
              children: [
                Container(
                  height: context.dynamicHeight(150),
                  child: WalletDetail(),
                ),
                Positioned(
                  child: FloatingActionButton(
                    onPressed: () => NavigationService.instance
                        .navigatorPushSlidePage(context, Pages.PAYMENT_DONE),
                    child: Icon(
                      Icons.done,
                      color: Colors.white,
                    ),
                  ),
                  bottom: 0,
                  right: 0,
                )
              ],
            )
          ],
        ));
  }
}
