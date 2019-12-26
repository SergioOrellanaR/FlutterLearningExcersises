import 'package:bloc_forms/src/blocs/Provider.dart';
import 'package:bloc_forms/src/routes/routes.dart';
import 'package:bloc_forms/src/userPreferences/userPreferences.dart';
import 'package:flutter/material.dart';

void main() async 
{
  //Sin esta linea la app se cae
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await prefs.initPrefs();
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',
        routes: routeMap(),
        theme: ThemeData(primaryColor: Colors.deepPurple),
      ),
    );
  }
}
