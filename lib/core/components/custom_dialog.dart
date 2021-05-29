import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/components/button/project_text_button.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/extensions/context/sized_box_extension.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/core/init/navigation/navigation_service.dart';

class CustomDialog extends StatefulWidget {
  final String title, content, action;
  final Widget actions;
  final Widget contentChild;
  final String img;

  const CustomDialog(
      {Key key,
      this.title,
      this.content,
      this.action,
      this.img,
      this.contentChild, this.actions})
      : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(ProjectConstants.ALERT_DIALOG_RADIUS),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _contentBox(),
    );
  }

  _contentBox() {
    return Stack(
      children: <Widget>[
        Container(
          padding: context.edgeInsetsOnly,
          //EdgeInsets.only(left: 20, top: 65, right: 20, bottom: 20)
          margin: context.topEdgeInsets,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(
                context.dynamicHeight(ProjectConstants.ALERT_DIALOG_RADIUS)),
            boxShadow: [
              BoxShadow(
                color: const Color(0x29000000),
                offset: Offset(0, 3),
                blurRadius: 6,
              ),
            ],
          ),
          child: widget.contentChild ?? Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ProjectTextLocale(
                text: widget.title ?? LocaleKeys.errors_errorLabel,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              context.lowSizedBoxHeight,
              ProjectTextLocale(
                text: widget.content ?? "",
                maxLines: 5,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(color: Colors.black87),
                align: TextAlign.center,
              ),
              context.lowestSizedBoxHeight,
              Align(
                alignment: Alignment.bottomRight,
                child: widget.actions ?? ProjectTextButton(
                    onPressed: () => NavigationService.instance.navigatorPop(context),
                    child: ProjectTextLocale(
                      text: LocaleKeys.button_labels_ok,
                      style: TextStyle(fontSize: 18),
                    )),
              ),
            ],
          ),
        ),
        Positioned(
          left: ProjectConstants.ALERT_DIALOG_RADIUS,
          right: ProjectConstants.ALERT_DIALOG_RADIUS,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: ProjectConstants.ALERT_DIALOG_ICON_RADIUS,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: Image.asset(
                  widget.img ?? ImageConstants.ALERT_GIF,
                  width: 45,
                )),
          ),
        ),
      ],
    );
  }
}
