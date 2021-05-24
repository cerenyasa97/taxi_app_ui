import 'package:easy_localization/easy_localization.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/init/languages/languages_manager.dart';
import 'package:piton_taxi_app/screens/search_location/utils/select_location_on_map_provider.dart';
import 'package:piton_taxi_app/screens/home/utils/google_map_provider.dart';
import 'package:piton_taxi_app/screens/home/service/locator.dart';
import 'package:piton_taxi_app/core/init/theme/project_theme.dart';
import 'package:piton_taxi_app/core/init/navigation/pages_import.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'core/extensions/theme/theme_extension.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async{
  setupLocator();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GoogleMapProvider()),
        ChangeNotifierProvider(create: (context) => ProjectThemeData()),
        ChangeNotifierProvider(
            create: (context) => SelectLocationOnMapProvider()),
      ],
      child: EasyLocalization(
        supportedLocales: LanguagesManager.instance.supportedLocales,
          path: TextConstants.LANGUAGE_PATH,
          child: TaxiApp()
      ),
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
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            theme: context.themeData,
            locale: context.locale,
            home: Splash()
        ));
  }
}