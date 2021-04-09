import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:piton_taxi_app/core/init/project_theme.dart';
import 'package:piton_taxi_app/screens/home/view/homepage.dart';
import 'package:piton_taxi_app/screens/menu/view/menu.dart';
import 'package:piton_taxi_app/screens/profile/view/profile.dart';
import 'package:piton_taxi_app/screens/splash/view/splash.dart';
import 'package:provider/provider.dart';
import 'screens/payment/view/payment_menu.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProjectThemeData()),
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
          theme: Provider.of<ProjectThemeData>(context).getThemeData,
          home: Menu() //Splash() HomePage() Profile() Menu(),
        )
    );
  }
}
