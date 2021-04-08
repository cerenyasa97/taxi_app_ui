import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:flutter/material.dart';
import 'login_card.dart';

class Login extends StatelessWidget {
  final transitionAnimation;

  const Login({Key key, this.transitionAnimation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: ProjectConstants.LOGIN_BACKGROUND_COLOR,
        body: Stack(
          children: [
            LoginCard(),
            Positioned(
              top: context.dynamicHeight(0.1),
              left: context.dynamicWidth(0.19),
              child: AnimatedBuilder(
                  animation: transitionAnimation,
                  child: Image.asset(
                    ImageConstants.TAXI_ICON,
                  ),
                  builder: (context, child) => ScaleTransition(
                        scale: Tween<double>(
                                begin: 0, end: 0.75)
                            .animate(transitionAnimation),
                        child: child
                      )),
            )
          ],
        ));
  }
}
