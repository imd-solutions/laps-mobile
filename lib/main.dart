import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:device_preview/device_preview.dart';
import 'views/views.dart';
import 'config/config.dart';
import 'config/router.dart' as router;

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

  setupLocator();

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LAPS App',
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        primaryColor: Palette.primaryColour,
      ),
      onGenerateRoute: router.generateRoute,
      initialRoute: IntroViewRoute,
      home: IntroView(),
    );
  }
}
