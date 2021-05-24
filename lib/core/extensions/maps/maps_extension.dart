import 'package:piton_taxi_app/core/init/navigation/pages_import.dart';
import 'package:piton_taxi_app/screens/home/utils/google_map_provider.dart';
import 'package:provider/provider.dart';

extension MapsExtension on BuildContext{
  GoogleMapProvider get mapProvider => Provider.of<GoogleMapProvider>(this, listen: false);
}