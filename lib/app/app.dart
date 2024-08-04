import 'package:sizer/sizer.dart';

import '../presentation/resources/routes_manager.dart';
import '../presentation/resources/theme_manager.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  MyApp._internal(); //private name  contrutor

  static final MyApp instance = MyApp._internal(); // Single instance

  factory MyApp() => instance; //factory
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      // useInheritedMediaQuery: true,
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.homeRoute,
          // home: const MyHomePage(title: 'Flutter Demo Home Page'),
          theme: getApplicationTheme(),
          // theme: ThemeData.light(),
          // darkTheme: ThemeData.dark(),
          // routes: {
          //   'webViewContainer' :(context) => WebViewContainer()
          // },
        );
      },
    );
  }
}
