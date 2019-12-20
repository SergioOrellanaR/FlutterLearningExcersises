import 'package:disenos/src/pages/BasicPage.dart';
import 'package:flutter/material.dart';


Map<String, WidgetBuilder> routeMap() {
  return <String, WidgetBuilder>{
    "home"                   : (BuildContext context) => BasicPage(),
  };
}
