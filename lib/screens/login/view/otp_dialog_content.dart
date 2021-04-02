import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/components/project_text_field.dart';

class OtpDialogContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /*
        Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey, width: 1)
            ),
            child: ProjectTextField(
              obsecureText: true,
              hintText: "0",
            ),
          ),
        */
      Container(
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
        border: Border.all(width: 1.0, color: const Color(0xff707070)),
      ),
    )
      ],
    );
  }
}