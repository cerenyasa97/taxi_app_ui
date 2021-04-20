import 'package:piton_taxi_app/core/components/project_button_bar.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/core/components/project_text_field.dart';
import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/constants/dummy_data/dummy_data.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/init/project_theme.dart';
import 'package:piton_taxi_app/core/base/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddAnotherAddress extends BaseView {
  @override
  _AddAnotherAddressState createState() => _AddAnotherAddressState();
}

class _AddAnotherAddressState extends BaseState<AddAnotherAddress> {
  ThemeData themeData;
  String addressLabel;
  String address;

  @override
  String appBarTitle() => TextConstants.ADDRESSES_ANOTHER;

  @override
  Widget body() {
    themeData = Provider.of<ProjectThemeData>(context).getThemeData;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        context.lowSizedBoxHeight,
        _textFields(TextConstants.ANOTHER_ADDRESS_LABEL),
        _textFields(TextConstants.ANOTHER_ADDRESS),
        ProjectButtonBar(
          onPressed: () {
            DummyData.user_1.addAnotherAddress(addressLabel, address);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  @override
  EdgeInsetsGeometry padding() => context.mediumEdgeInsetsSymmetric;

  _textFields(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProjectText(
          text: title,
          style: themeData.textTheme.bodyText1
              .copyWith(color: Colors.grey.shade700),
        ),
        ProjectTextField(
          keyboardType: TextInputType.text,
          contentPadding: context.textInputPadding,
          enabledBorder: themeData.inputDecorationTheme.enabledBorder,
          focusedBorder: themeData.inputDecorationTheme.focusedBorder,
          onChanged: (value) {
            title == TextConstants.ANOTHER_ADDRESS_LABEL
                ? addressLabel = value
                : address = value;
          },
        ),
        context.lowSizedBoxHeight,
      ],
    );
  }
}
