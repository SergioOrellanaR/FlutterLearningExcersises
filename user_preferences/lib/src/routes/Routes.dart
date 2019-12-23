import 'package:flutter/material.dart';
import 'package:user_preferences/src/pages/HomePage.dart';
import 'package:user_preferences/src/pages/SettingsPage.dart';

Map<String, WidgetBuilder> routeMap() {
  return <String, WidgetBuilder>{
    HomePage.routeName       : (BuildContext context) => HomePage(),
    SettingsPage.routeName   : (BuildContext context) => SettingsPage(),
  };
}
