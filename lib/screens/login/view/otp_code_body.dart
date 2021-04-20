import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/init/project_theme.dart';
import 'package:piton_taxi_app/screens/login/view/otp_dialog_content.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:piton_taxi_app/core/init/project_routes.dart';
import 'package:piton_taxi_app/widgets/next_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class OtpCodeDialog extends StatelessWidget {
  List<int> verificationCode = [];

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme =
        Provider.of<ProjectThemeData>(context).getThemeData.textTheme;
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.dynamicWidth(20 / 412)),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProjectText(
            text: TextConstants.GET_OTP_TITLE,
            style: textTheme.headline5.copyWith(color: Colors.black87),
          ),
          TweenAnimationBuilder(
            tween:
                Tween(begin: ProjectConstants.OTP_CODE_DURATION_SECOND, end: 0),
            duration: context.otpCodeDuration,
            builder: (context, value, child) => ProjectText(
              text: (value.toInt().toString() + TextConstants.SECONDS),
              style: textTheme.bodyText1.copyWith(fontWeight: FontWeight.w600),
            ),
            onEnd: () {
              // süre dolduğunda bir uyarı gönder
            },
          ),
        ],
      ),
      content: OtpDialogContent(onChanged: (List<int> code) {
        verificationCode = code;
      }),
      actions: [
        TextButton(
          child: ProjectText(
            color: Colors.black,
            text: "Resend OTP code",
            style: textTheme.bodyText1,
          ),
          onPressed: () {
            // otp kod yeniden gönderme işlemini tanımla
          },
        ),
        NextPage(
          onTap: () {
            // otp kod doğruluğunu test et
            Navigator.of(context).pushReplacement(
                ProjectRoute.generateSlidePageRouteBuilder(Pages.HOME,
                    ProjectConstants.FAST_PAGE_TRANSITION_DURATION));
          },
        )
      ],
    );
  }
}
