import 'package:piton_taxi_app/core/components/dropdown_menu/dropdown_menu_with_border.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/screens/payment/model/credit_card_model.dart';
import 'package:piton_taxi_app/core/constants/dummy_data/dummy_data.dart';
import 'package:piton_taxi_app/core/extensions/context/sized_box_extension.dart';
import 'package:piton_taxi_app/core/components/text_field/project_text_field.dart';
import 'package:piton_taxi_app/core/components/button_bar/project_button_bar.dart';
import 'package:piton_taxi_app/core/extensions/theme/theme_extension.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/widgets/alert_dialogs/error_alert_dialog.dart';
import 'package:piton_taxi_app/core/base/view/base_view.dart';
import 'package:piton_taxi_app/core/init/navigation/pages_import.dart';

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
  String appBarTitle() => LocaleKeys.addCreditCard_title;

  @override
  void initState() {
    super.initState();
    focusNode0 = FocusNode();
    focusNode1 = FocusNode();
    month = monthList.first.toString();
    year = yearList.first.toString();
  }

  @override
  Widget body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getText(context, focusNode0, LocaleKeys.addCreditCard_body_cardHolder_hint, LocaleKeys.addCreditCard_body_cardHolder_label),
        context.lowSizedBoxHeight,
        _getText(context, focusNode1, LocaleKeys.addCreditCard_body_CardNumber_hint, LocaleKeys.addCreditCard_body_CardNumber_label),
        context.lowSizedBoxHeight,
        ProjectTextLocale(
            text: LocaleKeys.addCreditCard_body_expirationDate,
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
                      contentText: LocaleKeys.payment_registeredCards_addCard_error_body,
                      title: LocaleKeys.payment_registeredCards_addCard_error_title,
                    ));
          }
        })
      ],
    );
  }

  Widget _getText(
      BuildContext context, FocusNode node, String hint, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProjectTextLocale(
            text: label,
            style: context.textTheme.bodyText1
                .copyWith(color: Colors.grey.shade700)),
        context.lowest0SizedBoxHeight,
        ProjectTextField(
          fNode: node,
          hintText: hint,
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
        ),
      ],
    );
  }

  @override
  EdgeInsetsGeometry padding() => context.mediumEdgeInsetsSymmetric;
}
