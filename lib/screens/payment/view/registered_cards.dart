import 'package:piton_taxi_app/core/components/project_svg_image.dart';
import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/core/base/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import '../../../core/components/project_text.dart';
import '../../../core/constants/app/constants.dart';
import '../../../core/constants/app/custom_text_style.dart';
import '../../../core/constants/dummy_data.dart';
import '../../../core/init/project_routes.dart';

class RegisteredCards extends BaseView {
  RegisteredCards({Key key}) : super(key: key);

  @override
  _RegisteredCardsState createState() => _RegisteredCardsState();
}

class _RegisteredCardsState extends BaseState<RegisteredCards> {
  final TextStyle style = CustomTextStyle.white11w8;

  @override
  String appBarTitle() => TextConstants.REGISTERED_CARDS_TITLE;

  @override
  Widget body() {
    return ListView.builder(
      itemCount: DummyData.cardList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pushReplacement(ProjectRoute.generateSlidePageRouteBuilder(Pages.HOME, ProjectConstants.FAST_PAGE_TRANSITION_DURATION)),
          child: Center(
            child: Stack(
              children: [
                ProjectSVGImage(imagePath: ImageConstants.CREDIT_CARD),
                Positioned(
                  child: Column(
                    children: [
                      ProjectText(
                        text: DummyData.cardList[index].cardNumber,
                        style: style,
                      ),
                      context.lowSizedBoxHeight,
                      Row(
                        children: [
                          ProjectText(
                            text: DummyData.cardList[index].cardHolder,
                            style: style,
                          ),
                          context.mediumSizedBoxWidth,
                          ProjectText(
                            text: DummyData.cardList[index].expirationDate,
                            style: style,
                          ),
                        ],
                      )
                    ],
                  ),
                  bottom: context.dynamicHeight(3/87),
                  left: context.dynamicWidth(20/412),
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
}
