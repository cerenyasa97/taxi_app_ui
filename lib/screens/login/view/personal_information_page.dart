import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/components/text_field/project_text_field.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/core/init/navigation/navigation_service.dart';
import 'package:piton_taxi_app/widgets/buttons/amber_button.dart';
import 'package:flutter/material.dart';
import 'login_base.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({Key key}) : super(key: key);

  @override
  _PersonalInformationState createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  FocusNode nameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return LoginBase(
      title: LocaleKeys.splash_welcome,
      description: LocaleKeys.login_addPersonalInfo_instruction,
      child: Padding(
        padding: context.lowestEdgeInsetsHorizontal2,
        child: Container(
          height: context.dynamicHeight(275),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _getInformation(
                  LocaleKeys.login_addPersonalInfo_nameSurnameLabel,
                  LocaleKeys.login_addPersonalInfo_enterNameSurname,
                      (text) {},
                  nameFocus),
              _getInformation(
                  LocaleKeys.login_addPersonalInfo_emailLabel,
                  LocaleKeys.login_addPersonalInfo_enterEmail,
                      (text) {},
                  emailFocus),
              AmberButton(
                width: context.dynamicWidth(200),
                onPressed: () => NavigationService.instance.navigatorPushReplacement(
                    context,
                    Pages.DRAWER),
                text: LocaleKeys.button_labels_save,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getInformation(String title, String name, Function(String) onChanged,
      FocusNode focusNode) {
    return Container(
      height: context.dynamicHeight(80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProjectTextLocale(
            text: title,
          ),
          ProjectTextField(
            fNode: focusNode,
            keyboardAction: focusNode == nameFocus ? TextInputAction.next : TextInputAction.done,
            onChanged: (text) => onChanged(text),
            hintText: name,
            onSubmitted: (text) => focusNode == nameFocus
                ? emailFocus.requestFocus()
                : context.closeKeyboard(),
          )
        ],
      ),
    );
  }
}
