import 'package:piton_taxi_app/core/init/project_theme.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:piton_taxi_app/screens/home/utils/google_map_provider.dart';
import 'package:piton_taxi_app/screens/home/service/locator.dart';
import 'package:piton_taxi_app/screens/home/view/homepage.dart';
import 'package:piton_taxi_app/screens/search_location/utils/select_location_on_map_provider.dart';
import 'core/extensions/theme_extension.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  setupLocator();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GoogleMapProvider()),
        ChangeNotifierProvider(create: (context) => ProjectThemeData()),
        ChangeNotifierProvider(create: (context) => SelectLocationOnMapProvider()),
      ],
      child: TaxiApp(),
    ));
  });
}

class TaxiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(412, 870),
        allowFontScaling: false,
        builder: () => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: context.themeData,
          home: HomePage()
        )
    );
  }
}
