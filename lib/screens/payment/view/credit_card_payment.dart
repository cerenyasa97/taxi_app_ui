import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/core/constants/dummy_data/dummy_data.dart';
import 'package:piton_taxi_app/core/extensions/theme/theme_extension.dart';
import 'package:piton_taxi_app/core/components/image/project_image.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/core/init/navigation/navigation_service.dart';
import 'package:piton_taxi_app/widgets/list_tile/custom_list_tile.dart';
import 'package:flutter/material.dart';

class CreditCardPayment extends StatelessWidget {
  const CreditCardPayment({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle = context.textTheme.headline4;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProjectTextLocale(
          text: LocaleKeys.payment_card,
          style: titleStyle,
        ),
        Container(
          height: context.dynamicHeight(140),
          child: ListView.builder(
            itemBuilder: (context, index) => CustomListTile(
              onTap: () => NavigationService.instance
                  .navigatorPushSlidePage(context, Pages.PAYMENT_DONE),
              title: DummyData.cardList[index].cardNumber,
              leadingCircleImage: ProjectImage(
                imagePath: ImageConstants.PAYMENT_WALLET,
                width: context.dynamicWidth(35),
              ),
              trailingIcon: Icon(Icons.check_circle_outline_sharp),
            ),
            itemCount: DummyData.cardList.length,
          ),
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.centerRight,
          child: FloatingActionButton(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () => NavigationService.instance
                .navigatorPushSlidePage(context, Pages.REGISTERED_CARDS),
          ),
        )
      ],
    );
  }
}
