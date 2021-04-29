import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/core/extensions/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/extensions/sized_box_extension.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/components/project_svg_image.dart';
import 'package:piton_taxi_app/core/extensions/theme_extension.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:piton_taxi_app/core/base/view/base_view.dart';
import '../../../core/constants/dummy_data/dummy_data.dart';
import '../../../core/components/project_text.dart';
import '../../../core/constants/app/constants.dart';
import '../../../core/init/project_routes.dart';
import 'package:flutter/material.dart';

class RegisteredCards extends BaseView {
  RegisteredCards({Key key}) : super(key: key);

  @override
  _RegisteredCardsState createState() => _RegisteredCardsState();
}

class _RegisteredCardsState extends BaseState<RegisteredCards> {

  @override
  String appBarTitle() => TextConstants.REGISTERED_CARDS_TITLE;

  @override
  Widget body() {
    return ListView.builder(
      itemCount: DummyData.cardList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          key: UniqueKey(),
          onTap: () => Navigator.of(context).pushReplacement(
              ProjectRoute.generateSlidePageRouteBuilder(
                  Pages.HOME, ProjectConstants.FAST_PAGE_TRANSITION_DURATION)),
          onPanUpdate: (detail) {
            if(detail.delta.dx > 0){
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
                      ProjectText(
                        text: DummyData.cardList[index].cardNumber,
                        style: context.textTheme
                            .headline3
                            .copyWith(color: Colors.white.withOpacity(0.95)),
                      ),
                      context.lowSizedBoxHeight,
                      Row(
                        children: [
                          ProjectText(
                            text: DummyData.cardList[index].cardHolder,
                            style: context.textTheme
                                .headline3
                                .copyWith(color: Colors.white.withOpacity(0.95)),
                          ),
                          context.mediumSizedBoxWidth,
                          ProjectText(
                            text: DummyData.cardList[index].expirationDate,
                            style: context.textTheme
                                .headline3
                                .copyWith(color: Colors.white.withOpacity(0.95)),
                          ),
                        ],
                      )
                    ],
                  ),
                  bottom: context.dynamicHeight(3 / 87),
                  left: context.dynamicWidth(20 / 412),
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
        onPressed: () => Navigator.of(context).push(
            ProjectRoute.generateSlidePageRouteBuilder(Pages.ADD_CARD,
                ProjectConstants.FAST_PAGE_TRANSITION_DURATION)),
      );
}
