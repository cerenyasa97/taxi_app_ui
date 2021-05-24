import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/core/init/navigation/navigation_service.dart';
import 'package:piton_taxi_app/screens/home/utils/google_map_provider.dart';
import 'package:piton_taxi_app/screens/search_location/view/select_location_on_map_widget.dart';
import 'package:piton_taxi_app/screens/search_location/view/address_text_field.dart';
import 'package:piton_taxi_app/screens/search_location/model/location_model.dart';
import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/extensions/context/sized_box_extension.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/core/base/view/base_view.dart';
import 'package:piton_taxi_app/core/init/navigation/pages_import.dart';
import 'package:piton_taxi_app/widgets/buttons/amber_button.dart';
import 'package:piton_taxi_app/core/constants/methods/scroll_widget_behavior.dart';
import 'package:piton_taxi_app/core/extensions/maps/maps_extension.dart';
import 'package:provider/provider.dart';
import 'registered_addresses.dart';
import 'use_current_location.dart';
import 'predictions_list.dart';

class SearchLocation extends BaseView {
  final title;
  final GlobalKey<SearchLocationState> key = GlobalKey<SearchLocationState>();

  SearchLocation(this.title);

  @override
  SearchLocationState createState() => SearchLocationState();
}

class SearchLocationState extends BaseState<SearchLocation> {
  TextEditingController controller;
  LocationModel location;

  @override
  String appBarTitle() => widget.title;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget body() {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProjectTextLocale(text: LocaleKeys.searchLocation_enterLocationLabel),
          context.lowestSizedBoxHeight,
          AddressTextField(searchLocationKey: widget.key),
          RegisteredAddresses(searchLocationKey: widget.key),
          SelectLocationOnMapWidget(searchLocationKey: widget.key),
          Consumer<GoogleMapProvider>(
            builder: (context, mapProvider, child) => Visibility(
              visible:
                  (mapProvider.initialLocation != mapProvider.currentLocation &&
                          widget.title == LocaleKeys.home_whereFromTo_to) ||
                      widget.title == LocaleKeys.home_whereFromTo_from,
              child: UseCurrentLocation(
                onTap: () {
                  controller.text = context.mapProvider.currentLocation.name;
                  location = context.mapProvider.currentLocation;
                },
              ),
            ),
          ),
          PredictionsList(
            searchLocationKey: widget.key,
            onTap: (location) {
              this.location = location;
            },
          ),
          AmberButton(
            onPressed: () {
              context.mapProvider.clearPlacePredictions();
              if (widget.title == LocaleKeys.home_whereFromTo_from) {
                context.mapProvider.setInitialLocation(location);
              } else {
                context.mapProvider.setDestinationLocation(location);
              }
              NavigationService.instance.navigatorPop(context);
              if (context.mapProvider.initialLocation != null &&
                  context.mapProvider.destinationLocation != null)
                context.mapProvider.getTripDirection();
            },
          )
        ],
      ),
    );
  }

  @override
  EdgeInsetsGeometry padding() => context.mediumEdgeInsetsSymmetric;
}
