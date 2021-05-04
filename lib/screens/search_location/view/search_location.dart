import 'package:piton_taxi_app/screens/search_location/utils/select_location_on_map_provider.dart';
import 'package:piton_taxi_app/screens/search_location/view/address_text_field.dart';
import 'package:piton_taxi_app/screens/search_location/model/location_model.dart';
import 'package:piton_taxi_app/core/extensions/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/extensions/sized_box_extension.dart';
import 'package:piton_taxi_app/screens/home/utils/google_map_provider.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:piton_taxi_app/core/base/view/base_view.dart';
import 'package:piton_taxi_app/core/init/project_routes.dart';
import 'package:piton_taxi_app/core/init/pages_import.dart';
import 'package:piton_taxi_app/screens/search_location/view/select_location_on_map_widget.dart';
import 'package:provider/provider.dart';
import 'registered_addresses.dart';
import 'use_current_location.dart';
import 'predictions_list.dart';
import '../../../widgets/amber_button.dart';


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
  GoogleMapProvider model;

  @override
  String appBarTitle() => widget.title;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
    setGoogleMapModel();
  }

  void setGoogleMapModel() {
    model = Provider.of<GoogleMapProvider>(context, listen: false);
  }

  @override
  Widget body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProjectText(text: TextConstants.ENTER_LOCATION_LABEL),
        context.lowestSizedBoxHeight,
        AddressTextField(searchLocationKey: widget.key),
        RegisteredAddresses(searchLocationKey: widget.key),
        SelectLocationOnMapWidget(searchLocationKey: widget.key),
        UseCurrentLocation(
          onTap: () {
            controller.text = model.currentLocation.name;
            location = model.currentLocation;
          },
        ),
        PredictionsList(searchLocationKey: widget.key, onTap: (location){
          this.location = location;
        },),
        AmberButton(onPressed: () {
          model.clearPlacePredictions();
          if(widget.title == TextConstants.WHERE_FROM){
            model.setInitialLocation(location);
          }else{
            model.setDestinationLocation(location);
          }
          Navigator.of(context).pop();
          if(model.initialLocation != null && model.destinationLocation != null) model.getDirection();
          else model.clearAll();
        },)
      ],
    );
  }

  @override
  EdgeInsetsGeometry padding() => context.mediumEdgeInsetsSymmetric;
}
