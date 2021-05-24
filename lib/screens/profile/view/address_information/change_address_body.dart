import 'package:piton_taxi_app/core/constants/methods/scroll_widget_behavior.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/screens/search_location/model/location_model.dart';
import 'package:piton_taxi_app/screens/search_location/model/place_model.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/screens/home/utils/google_map_provider.dart';
import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/constants/dummy_data/dummy_data.dart';
import 'package:piton_taxi_app/core/components/text_field/project_text_field.dart';
import 'package:piton_taxi_app/core/extensions/theme/theme_extension.dart';
import 'package:piton_taxi_app/core/base/view/map_base_view.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/core/extensions/maps/maps_extension.dart';
import 'package:piton_taxi_app/core/init/navigation/pages_import.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ChangeAddressBody extends MapBaseView {
  final String appBarTitle;

  ChangeAddressBody({@required this.appBarTitle});

  @override
  _ChangeAddressBodyState createState() => _ChangeAddressBodyState();
}

class _ChangeAddressBodyState extends MapBaseState<ChangeAddressBody> {
  TextEditingController controller;
  LocationModel selectedLocation;
  BitmapDescriptor locationMarker;

  @override
  String appBarTitle() => widget.appBarTitle;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget body() {
    return Column(
      children: [
        Container(
          color: Colors.white,
          height: context.dynamicHeight(130),
          child: Padding(
            padding: context.edgeInsetsOnly,
            child: ProjectTextField(
              hintText: LocaleKeys.searchLocation_hintText,
              controller: controller,
              onChanged: (text) {
                if (text.length > 1)
                 context.mapProvider.autocompleteAddress(text);
              },
              onSubmitted: (text) => onSubmitted(),
            ),
          ),
        ),
        Consumer<GoogleMapProvider>(
          builder: (context, mapModel, child) {
            locationMarker = mapModel.generalIcon;
            List<PlaceModel> predictions = mapModel.placePredictions;
            return ScrollConfiguration(
                behavior: MyBehavior(),
                child: Visibility(
                  child: Container(
                    padding: context.lowestEdgeInsetsHorizontal,
                    width: context.width,
                    height: context.dynamicHeight(470),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        backgroundBlendMode: BlendMode.darken),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () async {
                            controller.text = predictions[index].mainText;
                            selectedLocation = await mapModel
                                .getPlaceDetail(predictions[index].placeID);
                            mapController.animateCamera(CameraUpdate.newLatLng(
                                selectedLocation.latLong));
                            _addMarker(selectedLocation);
                            mapModel.clearPlacePredictions();
                          },
                          title: ProjectTextLocale(
                            text: predictions[index].mainText,
                            style: context.textTheme.subtitle2
                                .copyWith(color: Colors.white),
                          ),
                          subtitle: ProjectTextLocale(
                            text: predictions[index].secondaryText,
                            style: context.textTheme.bodyText2
                                .copyWith(color: Colors.white),
                          ),
                        );
                      },
                      itemCount: predictions.length,
                    ),
                  ),
                  visible: predictions != null && predictions.length != 0,
                ));
          },
        )
      ],
    );
  }

  @override
  EdgeInsetsGeometry padding() => EdgeInsets.zero;

  _addMarker(LocationModel location) {
    markerMap[MarkerId("Selected")] = Marker(
        markerId: MarkerId("Selected"),
        position: location.latLong,
        icon: locationMarker,
        infoWindow: InfoWindow(title: widget.appBarTitle));
    markerStreamController.sink.add(markerMap);
  }

  onSubmitted() {
    switch (widget.appBarTitle) {
      case LocaleKeys.addresses_homeLabel:
        DummyData.user_1.homeAddress = selectedLocation;
        break;
      case LocaleKeys.addresses_workLabel:
        DummyData.user_1.workAddress = selectedLocation;
        break;
      default:
        DummyData.user_1.anotherAddresses[widget.appBarTitle] =
            selectedLocation;
        break;
    }
    Navigator.of(context).pop();
  }

  @override
  onTap(LatLng location) {}

  @override
  onCameraMove(CameraPosition position) {}
}
