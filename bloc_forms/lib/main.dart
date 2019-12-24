import 'package:bloc_forms/src/blocs/Provider.dart';
import 'package:bloc_forms/src/routes/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: routeMap(),
        theme: ThemeData(primaryColor: Colors.deepPurple),
      ),
    );
  }
}
