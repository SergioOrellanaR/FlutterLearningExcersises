import 'package:flutter/material.dart';
// import 'package:componentes/src/pages/home_temp.dart';
import 'package:componentes/src/pages/alertPage.dart';
import 'package:componentes/src/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:flutter_cupertino_localizations/flutter_cupertino_localizations.dart';

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
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        ],
      supportedLocales: [
          const Locale('en'), // English
          const Locale('es', 'CL'), // Español
  ],
    );
  }
}


