import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/extensions/context/sized_box_extension.dart';
import 'package:piton_taxi_app/core/components/image/project_svg_image.dart';
import 'package:piton_taxi_app/core/extensions/theme/theme_extension.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:piton_taxi_app/core/base/view/base_view.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/core/init/navigation/navigation_service.dart';
import '../../../core/constants/dummy_data/dummy_data.dart';
import '../../../core/components/text/project_text_locale.dart';
import 'package:flutter/material.dart';

class RegisteredCards extends BaseView {
  RegisteredCards({Key key}) : super(key: key);

  @override
  _RegisteredCardsState createState() => _RegisteredCardsState();
}

class _RegisteredCardsState extends BaseState<RegisteredCards> {
  @override
  String appBarTitle() => LocaleKeys.payment_registeredCards_title;

  @override
  Widget body() {
    return ListView.builder(
      itemCount: DummyData.cardList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          key: UniqueKey(),
          onTap: () {},
          onPanUpdate: (detail) {
            if (detail.delta.dx > 0) {
              setState(() {
                DummyData.cardList.removeAt(index);
              });
            }
          },
          child: Center(
            child: Stack(
              children: [
                ProjectSVGImage(imagePath: ImageConstants.CREDIT_CARD),
                Positioned(
                  child: Column(
                    children: [
                      ProjectTextLocale(
                        text: DummyData.cardList[index].cardNumber,
                        style: context.textTheme.headline3
                            .copyWith(color: Colors.white.withOpacity(0.95)),
                      ),
                      context.lowSizedBoxHeight,
                      Row(
                        children: [
                          ProjectTextLocale(
                            text: DummyData.cardList[index].cardHolder,
                            style: context.textTheme.headline3.copyWith(
                                color: Colors.white.withOpacity(0.95)),
                          ),
                          context.mediumSizedBoxWidth,
                          ProjectTextLocale(
                            text: DummyData.cardList[index].expirationDate,
                            style: context.textTheme.headline3.copyWith(
                                color: Colors.white.withOpacity(0.95)),
                          ),
                        ],
                      )
                    ],
                  ),
                  bottom: context.dynamicHeight(30),
                  left: context.dynamicWidth(20),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  EdgeInsetsGeometry padding() => context.mediumEdgeInsetsSymmetric;

  @override
  FloatingActionButton floatingActionButton() => FloatingActionButton(
      child: Icon(
        Icons.add,
        size: 33,
        color: Colors.white,
      ),
      onPressed: () => NavigationService.instance
          .navigatorPushSlidePage(context, Pages.ADD_CARD));
}
