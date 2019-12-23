import 'package:flutter/material.dart';
import 'package:qr_reader_learning/src/pages/AddressesPage.dart';
import 'package:qr_reader_learning/src/pages/HomePage.dart';
import 'package:qr_reader_learning/src/pages/MapPage.dart';
import 'package:qr_reader_learning/src/pages/MapsPage.dart';


Map<String, WidgetBuilder> routeMap() {
  return <String, WidgetBuilder>{
    "home"                   : (BuildContext context) => HomePage(),
    "maps"                   : (BuildContext context) => MapsPage(),
    "addresses"              : (BuildContext context) => AdressesesPage(),
    "map"                    : (BuildContext context) => MapPage(),
  };
}
