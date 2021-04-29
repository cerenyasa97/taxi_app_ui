import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/extensions/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/extensions/theme_extension.dart';
import 'package:piton_taxi_app/core/components/project_text_button.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:flutter/material.dart';

class BookLaterFooter extends StatelessWidget {

  final VoidCallback onPressed;
  final VoidCallback cancelOnPressed;

  const BookLaterFooter({Key key, @required this.onPressed, this.cancelOnPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.mediumEdgeInsetsSymmetric,
      width: context.width,
      alignment: Alignment.bottomRight,
      child: ProjectTextButton(
        text: TextConstants.SAVE_BUTTON,
        style: context.textTheme.headline4.copyWith(color: Colors.amber),
        onPressed: onPressed,
      ),
    );
  }
}
