import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'login_card_body.dart';

class LoginCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: context.dynamicWidth(5 / 6),
        height: context.dynamicHeight(1 / 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(52.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0x29000000),
              offset: Offset(0, 1.5),
              blurRadius: 6,
            ),
          ],
        ),
        padding: EdgeInsets.only(top: context.dynamicHeight(1 / 10)),
        child: LoginCardBody(),
      ),
    );
  }
}
