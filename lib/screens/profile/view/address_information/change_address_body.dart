import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:piton_taxi_app/core/base/view/map_base_view.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/core/components/project_text_field.dart';
import 'package:piton_taxi_app/core/constants/dummy_data/dummy_data.dart';
import 'package:piton_taxi_app/core/extensions/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/init/pages_import.dart';
import 'package:piton_taxi_app/screens/home/model/google_map_model.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/screens/search_location/model/location_model.dart';
import 'package:piton_taxi_app/screens/search_location/model/place_model.dart';
import 'package:piton_taxi_app/core/extensions/theme_extension.dart';
import 'package:provider/provider.dart';

class ChangeAddressBody extends MapBaseView {
  final String appBarTitle;

  ChangeAddressBody({@required this.appBarTitle});

  @override
  _ChangeAddressBodyState createState() => _ChangeAddressBodyState();
}

class _ChangeAddressBodyState extends MapBaseState<ChangeAddressBody> {
  ValueNotifier<Map<MarkerId, Marker>> listenableMapMarker =
      ValueNotifier<Map<MarkerId, Marker>>({});
  TextEditingController controller;
  LocationModel selectedLocation;

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
          height: context.dynamicHeight(13 / 87),
          child: Padding(
            padding: context.edgeInsetsOnly,
            child: ProjectTextField(
              controller: controller,
              onChanged: (text) {
                if (text.length > 1)
                  Provider.of<GoogleMapModel>(context, listen: false)
                      .autocompleteAddress(text);
              },
              onSubmitted: (text) => onSubmitted(),
            ),
          ),
        ),
        Consumer<GoogleMapModel>(
          builder: (context, mapModel, child) {
            List<PlaceModel> predictions = mapModel.placePredictions;
            if (predictions != null && predictions.length != 0) {
              return Container(
                padding: context.lowestEdgeInsetsHorizontal,
                width: context.width,
                height: context.dynamicHeight(54 / 100),
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
                        mapModel.animateCameraNewLatLng(selectedLocation);
                        _addMarker(selectedLocation);
                        mapModel.clearPlacePredictions();
                      },
                      title: ProjectText(
                        text: predictions[index].mainText,
                        style: context.textTheme.subtitle2
                            .copyWith(color: Colors.white),
                      ),
                      subtitle: ProjectText(
                        text: predictions[index].secondaryText,
                        style: context.textTheme.bodyText2
                            .copyWith(color: Colors.white),
                      ),
                    );
                  },
                  itemCount: predictions.length,
                ),
              );
            } else {
              return Container();
            }
          },
        )
      ],
    );
  }

  @override
  EdgeInsetsGeometry padding() => EdgeInsets.zero;

  @override
  ValueNotifier<Map<MarkerId, Marker>> getMarkerListenable() =>
      listenableMapMarker;

  _addMarker(LocationModel location) {
    listenableMapMarker.value.clear();
    listenableMapMarker.value[MarkerId("Selected")] = Marker(
        markerId: MarkerId("Selected"),
        position: location.latLong,
        infoWindow: InfoWindow(title: widget.appBarTitle));
  }

  onSubmitted() {
    switch (widget.appBarTitle) {
      case TextConstants.ADDRESSES_HOME:
        DummyData.user_1.homeAddress = selectedLocation;
        break;
      case TextConstants.ADDRESSES_WORK:
        DummyData.user_1.workAddress = selectedLocation;
        break;
      default:
        DummyData.user_1.anotherAddresses[widget.appBarTitle] = selectedLocation;
        break;
    }
    Navigator.of(context).pop();
  }
}