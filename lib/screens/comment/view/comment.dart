import 'package:piton_taxi_app/core/components/rating_stars/project_rating_stars.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/screens/home/utils/google_map_provider.dart';
import 'package:piton_taxi_app/core/constants/images/image_constants.dart';
import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/constants/dummy_data/dummy_data.dart';
import 'package:piton_taxi_app/core/components/text_field/project_text_field.dart';
import 'package:piton_taxi_app/core/extensions/theme/theme_extension.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/widgets/buttons/menu_icon_button.dart';
import 'package:piton_taxi_app/core/extensions/maps/maps_extension.dart';
import 'package:piton_taxi_app/core/base/view/base_view.dart';
import 'package:piton_taxi_app/widgets/buttons/amber_button.dart';
import 'package:piton_taxi_app/widgets/image/circle_image.dart';
import 'package:flutter/material.dart';

class Comment extends BaseView {
  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends BaseState<Comment> {
  List<dynamic> _tipList = [10, 20, 30, "Add"];
  GoogleMapProvider mapProvider;
  int rating = 0;

  @override
  String appBarTitle() => LocaleKeys.tripRating_title;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => clearTrip());
  }

  @override
  Widget body() {
    final TextStyle titleStyle = context.textTheme.headline4;
    final TextStyle subtitleStyle =
        context.textTheme.subtitle2.copyWith(color: Colors.grey.shade600);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ProjectTextLocale(
          text: DummyData.driver.nameSurname,
          style: titleStyle,
        ),
        CircleImage(
          image: ImageConstants.DRIVER_IMAGE,
          width: 100,
        ),
        StarRating(
          onChanged: (index) {
            setState(() {
              rating = index ?? 0;
            });
          },
          size: 40,
          value: rating,
        ),
        ProjectTextLocale(
          text: LocaleKeys.tripRating_tipInstruction,
          style: subtitleStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
              _tipList.length,
              (index) => MenuIconButton(
                    onPressed: () {},
                    child: ProjectTextLocale(
                      text: _tipList[index].toString(),
                    ),
                  )),
        ),
        Padding(
          padding: context.lowEdgeInsetsHorizontal,
          child: ProjectTextField(
            minLines: 7,
            maxLines: 10,
            onChanged: (text) {},
            hintText: LocaleKeys.tripRating_commentHint,
          ),
        ),
        AmberButton(
          text: LocaleKeys.button_labels_save,
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );
  }

  @override
  EdgeInsetsGeometry padding() => context.lowEdgeInsetsAll;

  clearTrip() {
    context.mapProvider.clearAll();
  }
}
