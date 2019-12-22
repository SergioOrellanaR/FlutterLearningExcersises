import 'dart:io' show Platform;

import 'package:disenos/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //Distintas acciones según SO.

    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
          .copyWith(statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light));
    } else if (Platform.isIOS) {
      SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.white));
    }

    return MaterialApp(
      title: 'Diseños',
      debugShowCheckedModeBanner: false,
      routes: routeMap(),
      initialRoute: "scrollPage",
    );
  }
}
