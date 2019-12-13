import 'package:componentes/src/pages/alertPage.dart';
import 'package:componentes/src/pages/avatarPage.dart';
import 'package:componentes/src/pages/cardPage.dart';
import 'package:componentes/src/pages/homePage.dart';
import 'package:componentes/src/pages/animatedContainerPage.dart';
import 'package:componentes/src/pages/inputsPage.dart';
import 'package:componentes/src/pages/listViewPage.dart';
import 'package:componentes/src/pages/sliderPage.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routeMap() {
  return <String, WidgetBuilder>{
    "/"                   : (BuildContext context) => HomePage(),
    "alert"               : (BuildContext context) => AlertPage(),
    "avatar"              : (BuildContext context) => AvatarPage(),
    "card"                : (BuildContext context) => CardPage(),
    "animatedContainer"   : (BuildContext context) => AnimatedContainerPage(),
    "inputs"              : (BuildContext context) => InputPage(),
    "slider"              : (BuildContext context) => SliderPage(),
    "listViewPage"        : (BuildContext context) => ListViewPage()
  };
}
