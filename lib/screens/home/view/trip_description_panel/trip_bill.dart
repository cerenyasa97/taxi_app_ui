import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/screens/home/utils/google_map_provider.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/core/extensions/theme/theme_extension.dart';
import 'package:piton_taxi_app/core/components/image/project_image.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class TripBill extends StatefulWidget {
  const TripBill({Key key}) : super(key: key);

  @override
  _TripBillState createState() => _TripBillState();
}

class _TripBillState extends State<TripBill> {
  @override
  Widget build(BuildContext context) {
    final TextStyle descriptionStyle =
        context.textTheme.subtitle2.copyWith(color: Colors.black54);
    final TextStyle yellowStyle =
        context.textTheme.headline2.copyWith(color: Colors.amber, fontSize: 35);
    return Consumer<GoogleMapProvider>(
      builder: (context, mapModel, child) {
        List<String> distance =
        mapModel.tripDirectionModel.distanceText.split(" ");
        List<String> value = distance[0].split(",");
        double price = 4 + 4.5 * double.parse(value[0] + "." + value[1]);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _equalContainers(Alignment.centerRight, descriptionStyle,
                image: ImageConstants.BILL),
            _equalContainers(Alignment.center, yellowStyle,
                text: price.toStringAsFixed(2)),
            _equalContainers(Alignment.centerLeft, descriptionStyle,
                text: LocaleKeys.general_moneyCurrency),
          ],
        );
      },
    );
  }

  Container _equalContainers(Alignment align, TextStyle style,
      {String text, String image}) {
    return Container(
      alignment: align,
      width: context.dynamicWidth(120),
      child: image != null
          ? ProjectImage(
        imagePath: image,
        width: 50,
      )
          : ProjectTextLocale(
        text: text,
        style: style,
      ),
    );
  }
}

class ShowBottomSheet {
  static ShowBottomSheet _instance;
  static ShowBottomSheet get instance => _instance ??= ShowBottomSheet._initialize();

  showBottomSheet({BuildContext context, Widget widget,bool isScrollControlled, Color backgroundColor}) {
    showModalBottomSheet(
        backgroundColor: backgroundColor ?? Colors.white,
        isScrollControlled: isScrollControlled ?? false,
        context: context,
        builder: (BuildContext context) => widget
    );
  }

  ShowBottomSheet._initialize();
}