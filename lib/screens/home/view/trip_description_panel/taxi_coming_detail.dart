import 'package:piton_taxi_app/core/components/container/white_container_with_shadow.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/components/button/project_circular_button.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/screens/home/utils/google_map_provider.dart';
import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/core/constants/dummy_data/dummy_data.dart';
import 'package:piton_taxi_app/core/extensions/context/sized_box_extension.dart';
import 'package:piton_taxi_app/core/extensions/theme/theme_extension.dart';
import 'package:piton_taxi_app/core/components/image/project_image.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/core/init/navigation/pages_import.dart';
import 'package:piton_taxi_app/widgets/image/circle_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:piton_taxi_app/core/extensions/maps/maps_extension.dart';
import 'package:piton_taxi_app/core/extensions/string/string_extension.dart';

class TaxiComingDetail extends StatefulWidget {
  @override
  _TaxiComingDetailState createState() => _TaxiComingDetailState();
}

class _TaxiComingDetailState extends State<TaxiComingDetail> {
  @override
  Widget build(BuildContext context) {
    final TextTheme theme = context.textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        WhiteContainerWithShadow(
          width: 360,
          height: 100,
          color: Colors.white,
          padding: context.lowEdgeInsetsHorizontal,
          child: Row(
            children: [
              CircleImage(
                image: DummyData.driver.imagePath,
                width: context.dynamicWidth(70),
              ),
              context.lowSizedBoxWidth,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProjectTextLocale(
                      text: DummyData.driver.nameSurname,
                      style: theme.headline5.copyWith(color: Colors.black87),
                    ),
                    context.lowest0SizedBoxHeight,
                    ProjectTextLocale(
                      text: DummyData.driver.licensePlate,
                      style:
                          theme.bodyText2.copyWith(color: Colors.grey.shade600),
                    )
                  ],
                ),
                flex: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ProjectImage(
                    imagePath: ImageConstants.TIME_ICON,
                    width: 30,
                  ),
                  Consumer<GoogleMapProvider>(
                      builder: (context, mapModel, child) => ProjectTextLocale(
                            text: mapModel.dummyDuration.toInt().toString() +
                                " " + LocaleKeys.general_minute.locale,
                            style:
                                theme.headline5.copyWith(color: Colors.black87),
                          ))
                ],
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _getButtons((){}, ProjectImage(imagePath: ImageConstants.PHONE_ICON, width: 40,), LocaleKeys.taxiComing_menu_callLabel),
            _getButtons((){}, ProjectImage(imagePath: ImageConstants.MESSAGE_ICON, width: 40,), LocaleKeys.taxiComing_menu_messageLabel),
            _getButtons((){}, Icon(Icons.clear, size: 40,), LocaleKeys.button_labels_cancel)
          ],
        )
      ],
    );
  }

  _getButtons(VoidCallback onTap, Widget child, String text) {
    final textStyle = context.textTheme.headline6.copyWith(color: Colors.black87);
    return Column(
      children: [
      ProjectCircularButton(onPressed: onTap, child: child, color: Colors.white,),
        ProjectTextLocale(text: text, style: textStyle,)
      ],
    );
  }
}
