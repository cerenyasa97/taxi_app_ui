import 'package:piton_taxi_app/core/components/custom_dialog.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/core/constants/methods/show_dialog.dart';
import 'package:piton_taxi_app/widgets/image/circle_image.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
        CircleImage(width: 100, radius: 60),
        Positioned(
          bottom: -5,
          right: -5,
          child: IconButton(
              icon: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.linked_camera_rounded,
                  color: Colors.grey.shade600,
                ),
              ),
              onPressed: () => ProjectShowDialog.show(context, CustomDialog(
                contentChild: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ProjectTextLocale(
                      text: ,
                    )
                  ],
                ),
              ))),
        )
      ]),
    );
  }
}
