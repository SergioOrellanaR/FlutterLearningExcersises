import 'package:flutter/material.dart';
import 'package:user_preferences/src/sharedPreferences/UserPreferences.dart';
import 'package:user_preferences/src/widgets/MenuWidgets.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = "settings";

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool    _secondaryColor;
  int     _gender;
  String  _name;
  TextEditingController _textEditingController;
  final prefs = new UserPreferences();

  @override
  void initState() {
    super.initState();
    _gender = prefs.gender;
    _name = prefs.name;
    _secondaryColor = prefs.secondaryColor;
    _textEditingController = new TextEditingController(text: prefs.name);
    prefs.lastPageOpened = SettingsPage.routeName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajustes"),
        backgroundColor: (prefs.secondaryColor) ? Colors.teal : Colors.blueGrey,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            child: Text(
              "Configuraciones",
              style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          SwitchListTile(
            value: _secondaryColor,
            title: Text("Color secundario"),
            onChanged: (value) {
              setState(() {
                _secondaryColor = value;
                prefs.secondaryColor = value;
              });
            },
          ),
          RadioListTile(
            value: 1,
            title: Text("Masculino"),
            groupValue: _gender,
            onChanged: _setSelectedItem,
          ),
          RadioListTile(
            value: 2,
            title: Text("Femenino"),
            groupValue: _gender,
            onChanged: _setSelectedItem,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
              labelText: "Nombre", helperText: "Nombre de persona"),
              onChanged: (value) 
              {
                setState(() {
                  _name = value;
                  prefs.name = value;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  // _setSelectedItem(int value) async
  // {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   await prefs.setInt("gender", value);

  //   setState(() {
  //     _gender = value;
  //   });
  // }
  _setSelectedItem(int value) async {
    setState(() {
      prefs.gender = value;
      _gender = value;
    });
  }
}
