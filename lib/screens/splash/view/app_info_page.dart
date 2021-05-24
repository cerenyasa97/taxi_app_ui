import 'package:piton_taxi_app/core/components/button/project_text_button.dart';
import 'package:piton_taxi_app/core/constants/methods/scroll_widget_behavior.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/extensions/theme/theme_extension.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/core/init/navigation/navigation_service.dart';
import 'package:piton_taxi_app/core/init/navigation/pages_import.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/screens/splash/view/page_indicator.dart';
import 'splash_body.dart';

class AppInfo extends StatefulWidget {
  AppInfo({Key key}) : super(key: key);

  @override
  _AppInfoState createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {
  ValueNotifier listenableIndex = ValueNotifier<int>(0);
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final TextStyle buttonTextStyle =
        context.textTheme.headline2.copyWith(color: Colors.amber, fontSize: 20);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: context.mediumHorizontalEdgeInsets,
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: Column(
              children: [
                ProjectTextButton(
                  onPressed: () => _navigateHome(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
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
                Container(
                  width: double.infinity,
                  height: context.dynamicHeight(600),
                  child: PageView(
                    onPageChanged: (int pageIndex) {
                      listenableIndex.value = pageIndex;
                    },
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    children: [
                      SplashBody(
                        image: ImageConstants.SPLASH_1_VECTOR,
                        title: LocaleKeys.splash_info1_title,
                        body: LocaleKeys.splash_info1_instruction,
                      ),
                      SplashBody(
                        image: ImageConstants.SPLASH_2_VECTOR,
                        title: LocaleKeys.splash_info_2_title,
                        body: LocaleKeys.splash_info_2_instruction,
                      ),
                      SplashBody(
                        image: ImageConstants.SPLASH_3_VECTOR,
                        title: LocaleKeys.splash_info_3_title,
                        body: LocaleKeys.splash_info_3_instruction,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ValueListenableBuilder(
                        valueListenable: listenableIndex,
                        builder: (context, index, child) => IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: 35,
                              color: index == 0
                                  ? Colors.transparent
                                  : Colors.amber,
                            ),
                            onPressed: () {
                              listenableIndex.value > 0
                                  ? listenableIndex.value -= 1
                                  : listenableIndex.value =
                                      ProjectConstants.SPLASH_SCREEN_COUNT;
                              _animatePageTransition();
                            }),
                      ),
                      ValueListenableBuilder(
                          valueListenable: listenableIndex,
                          builder: (context, index, child) => PageIndicator(
                                index: index,
                              )),
                      IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 35,
                            color: Colors.amber,
                          ),
                          onPressed: () {
                            listenableIndex.value <
                                    ProjectConstants.SPLASH_SCREEN_COUNT - 1
                                ? listenableIndex.value += 1
                                : _navigateHome();
                            _animatePageTransition();
                          })
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _navigateHome() {
    NavigationService.instance.navigatorPushAndRemoveUntil(
        context,
        Pages.LOGIN,);
  }

  void _animatePageTransition() {
    controller.animateToPage(listenableIndex.value,
        curve: Curves.easeInOut, duration: Duration(milliseconds: 500));
  }
}
