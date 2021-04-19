import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/components/project_button_bar.dart';
import 'package:piton_taxi_app/core/components/project_image.dart';
import 'package:piton_taxi_app/core/init/project_theme.dart';
import '../../../core/constants/images/image_constants.dart';
import '../../../core/constants/dummy_data/dummy_data.dart';
import '../../../core/constants/text/text_constants.dart';
import '../../../core/components/project_text.dart';
import '../../../core/constants/app/constants.dart';
import '../../../core/constants/enums/routes.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/init/project_routes.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class PaymentPoints extends BaseView {
  PaymentPoints({Key key}) : super(key: key);

  @override
  _PaymentPointsState createState() => _PaymentPointsState();
}

class _PaymentPointsState extends BaseState<PaymentPoints> {
  @override
  String appBarTitle() => TextConstants.PAYMENT_POINTS;

  @override
  Widget body() {
    final TextTheme textTheme =
        Provider.of<ProjectThemeData>(context).getThemeData.textTheme;
    return ListView(
      children: [
        Center(
          child: Container(
              width: context.dynamicWidth(350 / 412),
              height: context.dynamicHeight(20 / 87),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(context.dynamicWidth(40 / 412)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProjectText(
                    text: TextConstants.TOTAL_POINTS_LABEL,
                    style: textTheme.headline4
                        .copyWith(color: Colors.black87),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ProjectImage(
                        imagePath: ImageConstants.PAYMENT_POINTS,
                      ),
                      ProjectText(
                          text: DummyData.TOTAL_POINTS,
                          style: textTheme.headline1),
                    ],
                  )
                ],
              )),
        ),
        ProjectButtonBar(
          rightButtonText: TextConstants.USE_BUTTON,
          onPressed: () => Navigator.of(context).pushReplacement(
              ProjectRoute.generateSlidePageRouteBuilder(
                  Pages.HOME, ProjectConstants.FAST_PAGE_TRANSITION_DURATION)),
        )
      ],
    );
  }

  @override
  EdgeInsetsGeometry padding() => context.mediumEdgeInsetsSymmetric;
}
