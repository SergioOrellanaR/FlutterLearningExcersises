import 'package:flutter/material.dart';
import 'package:user_preferences/src/pages/HomePage.dart';
import 'package:user_preferences/src/pages/SettingsPage.dart';

class MenuWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/menu-img.jpg"), fit: BoxFit.cover),
            ),
          ),

          _createListTile(Icons.pages     ,       "Home"     , () => Navigator.pushReplacementNamed(context, HomePage.routeName)),
          _createListTile(Icons.party_mode,       "Party Mode", (){}),
          _createListTile(Icons.people    ,       "People"    , (){}),
          _createListTile(Icons.settings  ,       "Settings"  , ()
          {
            //return Navigator.pop(context);
            //Redirige a página pero no permite volver XD, se usa para login por ejemplo
            return Navigator.pushReplacementNamed(context, SettingsPage.routeName);
            //Redirige a página y luego menú sigue ahí
            //return Navigator.pushNamed(context, SettingsPage.routeName);
          }),
        ],
      ),
    );
  }

  ListTile _createListTile(IconData icon, String text, Function function) {
    return ListTile(leading: Icon(icon, color: Colors.blue,),
        title: Text(text),
        onTap: function,);
  }
}