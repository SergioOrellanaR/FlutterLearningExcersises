import 'package:flutter/material.dart';
import 'package:user_preferences/src/sharedPreferences/UserPreferences.dart';
import 'package:user_preferences/src/widgets/MenuWidgets.dart';

class HomePage extends StatelessWidget {
  static final String routeName = "home";
  final prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {

    prefs.lastPageOpened = HomePage.routeName;
    return Scaffold(
      appBar: AppBar(
        title: Text("Preferencias de usuario"),
        backgroundColor: (prefs.secondaryColor) ? Colors.teal : Colors.blueGrey,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Color secundario: ${prefs.secondaryColor}"),
          Divider(),
          Text("Género: ${prefs.gender}"),
          Divider(),
          Text("Nombre de usuario: ${prefs.name}"),
          Divider(),
        ],
      ),
    );
  }

}
