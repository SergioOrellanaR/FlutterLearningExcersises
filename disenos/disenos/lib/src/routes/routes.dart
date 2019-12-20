import 'package:disenos/src/pages/BasicPage.dart';
import 'package:disenos/src/pages/BeautifulPage.dart';
import 'package:disenos/src/pages/ScrollPage.dart';
import 'package:flutter/material.dart';


Map<String, WidgetBuilder> routeMap() {
  return <String, WidgetBuilder>{
    "home"                   : (BuildContext context) => BasicPage(),
    "scrollPage"             : (BuildContext context) => ScrollPage(),
    "beautifulPage"          : (BuildContext context) => BeautifulPage()
  };
}
