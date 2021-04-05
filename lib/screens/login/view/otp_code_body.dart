import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/screens/login/view/otp_dialog_content.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/core/constants/constants.dart';
import 'package:piton_taxi_app/core/init/project_routes.dart';
import 'package:piton_taxi_app/widgets/next_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class OtpCodeDialog extends StatelessWidget{

  List<int> verificationCode = [];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.dynamicWidth(20 / 412)),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProjectText(text: getOtpTitle, style: Theme.of(context).textTheme.headline6,),
          TweenAnimationBuilder(
            tween: Tween(begin: otpCodeDurationSecond, end: 0),
            duration: context.otpCodeDuration,
            builder: (context, value, child) => ProjectText(
              text: (value.toInt().toString() + seconds),
              style: Theme.of(context).textTheme.subtitle1,
            ),
            onEnd: () {
              // süre dolduğunda bir uyarı gönder
            },
          ),
        ],
      ),
      content: OtpDialogContent(
        onChanged: (List<int> code) {
          verificationCode = code;
        }
      ),
      actions: [
        TextButton(
          child: ProjectText(
            color: Colors.black,
            text: "Resend OTP code",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          onPressed: () {
            // otp kod yeniden gönderme işlemini tanımla
          },
        ),
        SizedBox(width: context.dynamicWidth(1/4),),
        NextPage(
          onTap: () {
            // otp kod doğruluğunu test et
            Navigator.of(context).pushAndRemoveUntil(
                ProjectRoute.generateMaterialPageRoute('/home'),
                (Route<dynamic> route) => false);
          },
        )
      ],
    );
  }
}
