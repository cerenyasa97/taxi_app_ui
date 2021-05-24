import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/extensions/context/sized_box_extension.dart';
import 'package:piton_taxi_app/core/extensions/theme/theme_extension.dart';
import 'package:piton_taxi_app/core/components/image/project_image.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/core/init/navigation/pages_import.dart';
import 'package:flutter/material.dart';

class SplashBody extends StatelessWidget {
  final String image;
  final String title;
  final String body;

  const SplashBody(
      {Key key, this.image, this.title, this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle yellowTextStyle = context.textTheme.headline2.copyWith(
        color: Colors.amber, fontStyle: FontStyle.italic, fontSize: 28);
    final TextStyle bodyTextStyle =
        context.textTheme.headline5.copyWith(color: Colors.grey.shade800);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProjectImage(
          imagePath: image,
          height: context.dynamicHeight(450),
        ),
        context.mediumSizedBoxHeight,
        ProjectTextLocale(
          text: title,
          style: yellowTextStyle,
        ),
        context.lowestSizedBoxHeight,
        Flexible(
            child: ProjectTextLocale(
              text: LocaleKeys.splash_splashText,
              style: bodyTextStyle,
              maxLines: 5,
              align: TextAlign.center,
            )),
      ],
    );
  }
}
/*
Padding(
            padding: context.medium1EdgeInsetsSymmetric,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProjectImage(
                  imagePath: image,
                  width: context.dynamicWidth(width),
                ),
                context.mediumSizedBoxHeight,
                ProjectTextLocale(
                  text: title,
                  style: yellowTextStyle,
                ),
                context.lowestSizedBoxHeight,
                Flexible(
                    child: ProjectTextLocale(
                  text: LocaleKeys.splash_splashText,
                  style: bodyTextStyle,
                  maxLines: 5,
                  align: TextAlign.center,
                )),
              ],
            ),
          )
 */
/*
Positioned(
          child: ProjectElevatedButton(
            width: context.dynamicWidth(100),
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                ProjectRoute.generateSlidePageRouteBuilder(
                  Pages.LOGIN, ProjectConstants.FAST_PAGE_TRANSITION_DURATION,),
                    (route) => false),
            color: Colors.transparent,
            child: Row(
              children: [
                ProjectTextLocale(
                  text: LocaleKeys.button_labels_skip,
                  style: buttonTextStyle,
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.amber,
                )
              ],
            ),
          ),
          top: context.dynamicHeight(50),
          right: context.dynamicWidth(20),
        ),
        Positioned(
          child: ValueListenableBuilder(
              valueListenable: listenableIndex,
              builder: (context, index, child) => PageIndicator(
                index: index,
              )),
          bottom: context.dynamicHeight(50),
          left: context.dynamicWidth(150),
        )
 */