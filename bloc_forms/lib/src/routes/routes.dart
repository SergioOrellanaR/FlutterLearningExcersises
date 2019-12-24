import 'package:bloc_forms/src/pages/HomePage.dart';
import 'package:bloc_forms/src/pages/LoginPage.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routeMap() {
   return <String, WidgetBuilder>{
   "home": (BuildContext context) => HomePage(),
   "login": (BuildContext context) => LoginPage(),
   };
}