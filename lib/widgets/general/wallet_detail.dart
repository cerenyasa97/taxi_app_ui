import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/components/image/project_image.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/core/constants/dummy_data/dummy_data.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/core/extensions/theme/theme_extension.dart';
import 'package:piton_taxi_app/core/extensions/context/sized_box_extension.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';

class WalletDetail extends StatefulWidget {
  const WalletDetail({Key key}) : super(key: key);

  @override
  _WalletDetailState createState() => _WalletDetailState();
}

class _WalletDetailState extends State<WalletDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProjectTextLocale(
          text: LocaleKeys.payment_wallet_budget_label,
          style:
          context.textTheme.headline4.copyWith(color: Colors.black87),
        ),
        context.lowSizedBoxHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _getEqualContainers(
                ProjectImage(
                  imagePath: ImageConstants.PAYMENT_WALLET,
                ),
                Alignment.centerRight),
            _getEqualContainers(
                ProjectTextLocale(
                    text: DummyData.TOTAL_POINTS,
                    style: context.textTheme.headline1.copyWith(color: Colors.amber)),
                Alignment.center),
            _getEqualContainers(
                ProjectTextLocale(
                  text: LocaleKeys.general_moneyCurrency,
                  style: context.textTheme.headline5
                      .copyWith(color: Colors.black87),
                ),
                Alignment.centerLeft)
          ],
        ),
      ],
    );
  }

  _getEqualContainers(Widget child, Alignment align) {
    return Container(
      width: context.dynamicWidth(120),
      alignment: align,
      child: child,
    );
  }
}
