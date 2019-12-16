import 'package:flutter/material.dart';
import 'package:peliculas_learning/src/routes/routes.dart';


//Llamado inicio
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Películas',
      initialRoute: 'home',
      routes: routeMap(),
      debugShowCheckedModeBanner: false
    );
  }
}