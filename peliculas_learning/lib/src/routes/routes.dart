import 'package:flutter/material.dart';
import 'package:peliculas_learning/src/pages/HomePage.dart';

Map<String, WidgetBuilder> routeMap() {
  return <String, WidgetBuilder>{
    "home"                   : (BuildContext context) => HomePage()
  };
}
