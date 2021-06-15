import 'package:package_info/package_info.dart';
import 'package:piton_taxi_app/core/components/image/project_image.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/core/init/navigation/navigation_service.dart';
import 'package:piton_taxi_app/core/extensions/string/string_extension.dart';
import 'package:piton_taxi_app/screens/home/utils/google_map_provider.dart';
import '../../../core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/core/extensions/context/sized_box_extension.dart';
import 'package:piton_taxi_app/core/extensions/theme/theme_extension.dart';
import '../../../core/constants/app/project_animation.dart';
import '../../../core/constants/app/constants.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:piton_taxi_app/core/components/custom_dialog.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  AnimationController controller;
  ProjectAnimation _animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = ProjectAnimation(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (context.watch<GoogleMapProvider>().permissionStatus.isGranted) splashMove();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FutureBuilder(
            future: _getVersion(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                controller.forward();
                return AnimatedBuilder(
                    animation: _animation.splashIconAnimation,
                    child: _splashBody(snapshot.data),
                    builder: (BuildContext context, Widget child) {
                      return Transform.scale(
                        scale: _animation.splashIconAnimation.value,
                        child: child,
                      );
                    });
              } else {
                if (snapshot.hasError) {
                  Future.delayed(
                      Duration(seconds: 1),
                      () => showDialog(
                          context: context,
                          builder: (context) => CustomDialog(
                                content: LocaleKeys.errors_snapshotError,
                                title: "Error",
                                action: LocaleKeys.button_labels_ok,
                                img: ImageConstants.TIME_ICON,
                              )));
                }
                return Container();
              }
            }),
      ),
    );
  }

  _splashBody(String versionName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Container(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProjectImage(
              imagePath: ImageConstants.TAXI_ICON,
              width: context.dynamicWidth(190),
            ),
            context.lowSizedBoxHeight,
            ProjectTextLocale(
              text: LocaleKeys.splash_splashText,
              style:
                  context.textTheme.headline3.copyWith(color: Colors.black87),
              align: TextAlign.center,
            ),
          ],
        ))),
        ProjectTextLocale(
          text: LocaleKeys.splash_versionLabel.locale + versionName,
          style: context.textTheme.bodyText1,
        )
      ],
    );
  }

  _getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    controller.forward();
    return packageInfo.version;
  }

  splashMove() {
    Timer(Duration(seconds: 2), () => navigatePage());
  }

  navigatePage() {
    NavigationService.instance.navigatorPushReplacement(context, Pages.APP_INFO,
        duration: ProjectConstants.SLOW_PAGE_TRANSITION_DURATION);
  }
}
