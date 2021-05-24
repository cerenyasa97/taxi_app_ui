import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/screens/search_location/utils/select_location_on_map_provider.dart';
import 'package:piton_taxi_app/screens/search_location/model/location_model.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/base/view/map_base_view.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:piton_taxi_app/core/extensions/maps/maps_extension.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:piton_taxi_app/core/init/navigation/pages_import.dart';
import 'package:piton_taxi_app/widgets/buttons/amber_button.dart';
import 'package:provider/provider.dart';

class SelectLocationOnMapScreen extends MapBaseView {
  final GlobalKey<SearchLocationState> searchLocationKey;

  SelectLocationOnMapScreen({this.searchLocationKey});

  @override
  _SelectLocationOnMapScreenState createState() =>
      _SelectLocationOnMapScreenState();
}

class _SelectLocationOnMapScreenState
    extends MapBaseState<SelectLocationOnMapScreen> {
  LatLng latLng;
  BitmapDescriptor locationMarker;

  @override
  String appBarTitle() => LocaleKeys.searchLocation_selectOnMap_title;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      context.mapProvider.fetchCurrentLocation();
      _addMarker(context.mapProvider.currentLocation.latLong);
    });
  }

  @override
  Widget body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              backgroundBlendMode: BlendMode.darken),
          height: context.dynamicHeight(120),
          padding: context.edgeInsetsOnly,
          child: ProjectTextLocale(
            text: LocaleKeys.searchLocation_selectOnMap_instruction,
            maxLines: 3,
            color: Colors.white,
            align: TextAlign.center,
          ),
        ),
        Padding(
          padding: context.mediumEdgeInsetsSymmetric,
          child: AmberButton(
            onPressed: () async {
              LocationModel location =
                  await Provider.of<SelectLocationOnMapProvider>(context,
                          listen: false)
                      .fetchLocationOnTap(latLng);
              Navigator.of(context).pop(location);
            },
          ),
        ),
      ],
    );
  }

  @override
  EdgeInsetsGeometry padding() => EdgeInsets.zero;

  @override
  onTap(LatLng latLng) async {
    _addMarker(latLng);
    mapController.animateCamera(CameraUpdate.newLatLng(latLng));
    this.latLng = latLng;
  }

  @override
  onCameraMove(CameraPosition position) async {
    _addMarker(position.target);
    latLng = position.target;
  }

  _addMarker(LatLng latLng) {
    markerMap[MarkerId("Selected")] = Marker(
        markerId: MarkerId("Selected"),
        position: latLng,
        icon: context.mapProvider.generalIcon,
        infoWindow: InfoWindow(title: "Selected Location"));
    markerStreamController.sink.add(markerMap);
  }
}
