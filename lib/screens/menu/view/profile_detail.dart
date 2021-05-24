import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/widgets/image/circle_image.dart';

class ProfileDetail extends StatelessWidget {

  final VoidCallback onPressed;

  const ProfileDetail({Key key, @required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(child: IconButton(icon: Icon(
          Icons.close,
          size: 30,
          color: Colors.white,
        ), onPressed: () => onPressed()), flex: 2,),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Jonh Doe",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            Text(
              "+90 542 546 78 21",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white70),
            )
          ],
        ), flex:10),
        Flexible(
          child: Align(
            child: CircleImage(image: ImageConstants.USER_IMAGE, width: context.dynamicWidth(70),),
            alignment: Alignment.centerRight,
          ), flex: 4,)
      ],
    );
  }
}
