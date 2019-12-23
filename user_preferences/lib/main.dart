import 'package:flutter/material.dart';
import 'package:user_preferences/src/routes/Routes.dart';
import 'package:user_preferences/src/sharedPreferences/UserPreferences.dart';
 

//Este proyecto tiene como objetivo aprender como guardar configuraciones de usuarios en la memoria del dispositivo
void main() async
{
  //Sin esta linea la app se cae
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await prefs.initPrefs();
  runApp(MyApp());
} 
 
class MyApp extends StatelessWidget {
  final prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferencias de usuario',
      initialRoute: prefs.lastPageOpened,
      routes: routeMap(),
      debugShowCheckedModeBanner: false,
    );
  }
}