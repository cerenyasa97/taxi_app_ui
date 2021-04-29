import 'package:piton_taxi_app/core/extensions/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:piton_taxi_app/core/init/pages_import.dart';
import '../../../core/constants/text/text_constants.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../../core/base/view/map_base_view.dart';
import 'package:flutter/material.dart';
import 'book_later_header.dart';
import 'book_later_panel.dart';
import 'book_later_footer.dart';

class BookLater extends MapBaseView {
  BookLater({Key key}) : super(key: key);

  @override
  _BookLaterState createState() => _BookLaterState();
}

class _BookLaterState extends MapBaseState<BookLater> {
  MapType _mapType;
  DateTime date;

  @override
  String appBarTitle() => TextConstants.MENU_BOOK_LATER;

  @override
  EdgeInsetsGeometry padding() => context.mediumEdgeInsetsSymmetric;

  @override
  MapType mapType() => _mapType;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    date = DateTime.now();
  }

  @override
  Widget body() {
    return SlidingUpPanel(
      minHeight: context.dynamicHeight(14 / 87),
      maxHeight: context.dynamicHeight(45 / 87),
      panel: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BookLaterHeader(
            date: date,
          ),
          BookLaterPanel(
            onDateTimeChanged: (dateTime) {
              date = dateTime;
            },
          ),
          BookLaterFooter(
            onPressed: () {
              setState(() {});
            },
          ),
        ],
      ),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(context.dynamicWidth(40 / 412)),
          topRight: Radius.circular(context.dynamicWidth(40 / 412))),
    );
  }

  @override
  ValueNotifier<Map<MarkerId, Marker>> getMarkerListenable() {
    // TODO: implement getMarkerListenable
    throw UnimplementedError();
  }
}
