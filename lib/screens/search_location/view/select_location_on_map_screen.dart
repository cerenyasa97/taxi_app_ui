import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:piton_taxi_app/screens/home/utils/google_map_provider.dart';
import 'package:piton_taxi_app/screens/search_location/model/location_model.dart';
import 'package:piton_taxi_app/screens/search_location/utils/select_location_on_map_provider.dart';
import 'package:flutter/src/painting/edge_insets.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';
import 'package:piton_taxi_app/core/base/view/map_base_view.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/init/pages_import.dart';
import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/extensions/edge_insets_extension.dart';
import 'package:piton_taxi_app/widgets/amber_button.dart';
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

  @override
  String appBarTitle() => TextConstants.SELECT_ON_MAP;

  @override
  void initState() {
    super.initState();
    var mapModel = Provider.of<GoogleMapProvider>(context, listen: false);
    mapModel.fetchCurrentLocation();
    _addMarker(mapModel.currentLocation.latLong);
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
          height: context.dynamicHeight(12 / 87),
          padding: context.edgeInsetsOnly,
          child: ProjectText(
            text: TextConstants.SELECT_ON_MAP_HINT,
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
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
        infoWindow: InfoWindow(title: "Selected Location"));
    markerStreamController.sink.add(markerMap);
  }
}
