import 'package:piton_taxi_app/core/components/dropdown_menu_with_border.dart';
import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/extensions/edge_insets_extension.dart';
import 'package:piton_taxi_app/screens/payment/model/credit_card_model.dart';
import 'package:piton_taxi_app/core/constants/dummy_data/dummy_data.dart';
import 'package:piton_taxi_app/core/extensions/sized_box_extension.dart';
import 'package:piton_taxi_app/core/components/project_text_field.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/components/project_button_bar.dart';
import 'package:piton_taxi_app/core/extensions/theme_extension.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/widgets/error_alert_dialog.dart';
import 'package:piton_taxi_app/core/base/view/base_view.dart';
import 'package:piton_taxi_app/core/init/pages_import.dart';

class AddCreditCard extends BaseView {
  @override
  _AddCreditCardState createState() => _AddCreditCardState();
}

class _AddCreditCardState extends BaseState<AddCreditCard> {
  List<int> monthList = List.generate(12, (index) => index + 1);
  List<int> yearList =
      List.generate(10, (index) => DateTime.now().year - 2000 + index);
  FocusNode focusNode0;
  FocusNode focusNode1;
  String cardHolder = "";
  String cardNumber = "";
  String month;
  String year;

  @override
  String appBarTitle() => TextConstants.ADD_CREDIT_CARD_TITLE;

  @override
  void initState() {
    super.initState();
    focusNode0 = FocusNode();
    focusNode1 = FocusNode();
    focusNode0.requestFocus();
    month = monthList.first.toString();
    year = yearList.first.toString();
  }

  @override
  Widget body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProjectText(
            text: "Card Holder",
            style: context.textTheme.bodyText1
                .copyWith(color: Colors.grey.shade700)),
        _getText(context, focusNode0),
        context.lowSizedBoxHeight,
        ProjectText(
            text: "Card Number",
            style: context.textTheme.bodyText1
                .copyWith(color: Colors.grey.shade700)),
        _getText(context, focusNode1),
        context.lowSizedBoxHeight,
        ProjectText(
            text: "Expiration Date",
            style: context.textTheme.bodyText1
                .copyWith(color: Colors.grey.shade700)),
        Row(
          children: [
            DropDownMenuWithBorder(
              dropdownList: monthList,
              onChanged: (value) => month = value,
            ),
            context.lowSizedBoxWidth,
            DropDownMenuWithBorder(
              dropdownList: yearList,
              onChanged: (value) => year = value,
            ),
          ],
        ),
        ProjectButtonBar(onPressed: () {
          if (cardHolder.length > 3 && cardNumber.length == 16) {
            DummyData.cardList
                .add(CreditCard(cardHolder, cardNumber, "$month/$year"));
            Navigator.of(context).pop();
          } else {
            return showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => ErrorAlertDialog(
                      contentText: TextConstants.CREDIT_CARD_ADD_ERROR,
                      title: TextConstants.INPUT_ERROR,
                    ));
          }
        })
      ],
    );
  }

  ProjectTextField _getText(
      BuildContext context, FocusNode node) {
    return ProjectTextField(
      fNode: node,
      keyboardType:
          node == focusNode0 ? TextInputType.text : TextInputType.number,
      contentPadding: context.textInputPadding,
      enabledBorder: context.inputDecorationTheme.enabledBorder,
      focusedBorder: context.inputDecorationTheme.focusedBorder,
      maxLength: node == focusNode0 ? null : 16,
      onChanged: (value) =>
          node == focusNode0 ? cardHolder = value : cardNumber = value,
      onSubmitted: (text) => node == focusNode0
          ? context.nextFocusNode(focusNode1)
          : focusNode1.unfocus(),
    );
  }

  @override
  EdgeInsetsGeometry padding() => context.mediumEdgeInsetsSymmetric;
}
