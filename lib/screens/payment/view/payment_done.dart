import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/core/extensions/context/sized_box_extension.dart';
import 'package:piton_taxi_app/core/extensions/theme/theme_extension.dart';
import 'package:piton_taxi_app/core/components/image/project_image.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/init/navigation/project_routes.dart';
import 'package:piton_taxi_app/widgets/buttons/amber_button.dart';

class PaymentDone extends StatefulWidget {
  const PaymentDone({Key key}) : super(key: key);

  @override
  _PaymentDoneState createState() => _PaymentDoneState();
}

class _PaymentDoneState extends State<PaymentDone>{
  @override
  Widget build(BuildContext context) {
    final TextStyle yellowTextStyle = context.textTheme.headline2.copyWith(
        color: Colors.amber, fontStyle: FontStyle.italic, fontSize: 32);
    final TextStyle bodyTextStyle =
        context.textTheme.headline5.copyWith(color: Colors.grey.shade800);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: context.mediumEdgeInsetsSymmetric,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProjectImage(
                imagePath: ImageConstants.PAYMENT_DONE_VECTOR,
                width: context.dynamicWidth(360),
              ),
              context.mediumSizedBoxHeight,
              ProjectTextLocale(
                text: LocaleKeys.paymentDone,
                style: yellowTextStyle,
              ),
              context.lowestSizedBoxHeight,
              Flexible(
                  child: ProjectTextLocale(
                text: LocaleKeys.splash_info_2_instruction,
                style: bodyTextStyle,
                maxLines: 5,
                align: TextAlign.center,
              )),
              context.heightSizedBoxHeight,
              AmberButton(
                text: LocaleKeys.button_labels_next,
                onPressed: () => Navigator.of(context).pushReplacement(
                    ProjectRoute.generateSlidePageRouteBuilder(Pages.COMMENT,
                        ProjectConstants.FAST_PAGE_TRANSITION_DURATION)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
