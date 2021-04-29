import 'package:get_it/get_it.dart';
import 'package:piton_taxi_app/screens/home/service/google_api_repository.dart';
import 'package:piton_taxi_app/screens/home/service/google_api_service.dart';
import 'package:piton_taxi_app/screens/profile/service/search_address_service.dart';

GetIt locator = GetIt.instance;

// Classes registered to GetIt package, in accordance with Singleton pattern;
// an instance is created and a single instance is accessed from all parts of the application.
void setupLocator() {
  locator.registerLazySingleton(() => GoogleApiService());
  locator.registerLazySingleton(() => GoogleMapRepository());
  locator.registerLazySingleton(() => SearchAddressService());
}
