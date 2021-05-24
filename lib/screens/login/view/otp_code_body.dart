import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/core/init/theme/project_theme.dart';
import 'package:piton_taxi_app/screens/login/view/otp_dialog_content.dart';
import 'package:piton_taxi_app/core/extensions/string/string_extension.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:piton_taxi_app/core/init/navigation/project_routes.dart';
import 'package:piton_taxi_app/widgets/buttons/next_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class OtpCodeDialog extends StatelessWidget {
  List<int> verificationCode = [];

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme =
        Provider.of<ProjectThemeData>(context).themeData.textTheme;
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ProjectConstants.ALERT_DIALOG_RADIUS),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            LocaleKeys.login_otp_verificationTitle.locale,
            style: textTheme.headline5.copyWith(color: Colors.black87),
          ),
          TweenAnimationBuilder(
            tween:
                Tween(begin: ProjectConstants.OTP_CODE_DURATION_SECOND, end: 0),
            duration: context.otpCodeDuration,
            builder: (context, value, child) => ProjectTextLocale(
              text: (value.toInt().toString() + LocaleKeys.login_otp_seconds),
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
          child: ProjectTextLocale(
            color: Colors.black,
            text: LocaleKeys.login_otp_resendOtpCode,
            style: textTheme.bodyText1,
          ),
          onPressed: () {
            // otp kod yeniden gönderme işlemini tanımla
          },
        ),
        NextPageButton(
          onTap: () {
            // otp kod doğruluğunu test et
            Navigator.of(context).pushAndRemoveUntil(
                ProjectRoute.generateSlidePageRouteBuilder(Pages.PERSONAL_INFORMATION,
                    ProjectConstants.FAST_PAGE_TRANSITION_DURATION),(Route<dynamic> route) => false);
          },
        )
      ],
    );
  }
}
