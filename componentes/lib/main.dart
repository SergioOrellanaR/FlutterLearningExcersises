
import 'package:flutter/material.dart';
// import 'package:componentes/src/pages/home_temp.dart';
import 'package:componentes/src/pages/alertPage.dart';
import 'package:componentes/src/routes/routes.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      //home: HomePageTemp()
      //home: HomePage(),
      routes: routeMap(),
      onGenerateRoute: ( RouteSettings settings )
      {
        return MaterialPageRoute(builder: (context) => AlertPage());
      },
    );
  }
}