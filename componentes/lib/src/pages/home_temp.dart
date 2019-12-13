import 'package:flutter/material.dart';


//Esta clase no está actualmente en uso, pero existe para fines didácticos.

class HomePageTemp extends StatelessWidget {
  final List<String> options = ["Uno", "Dos", "Tres", "Cuatro", "Cinco"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes Temp"),
      ),
      body: ListView(
        children: _createItemsShort()
        ),
    );
  }

  List<Widget> _createItems() 
  {
    List<Widget> returnList = List<Widget>();

    for (String item in options) 
    {
      Widget tempWidget = ListTile(title: Text(item));
      returnList..add(tempWidget)
                ..add(Divider(color: Colors.black, thickness: 10.0));
    }

    return returnList;
  }

  List<Widget> _createItemsShort()
  {
    var widgets = options.map(
      (item)
      {
        return Column(
          children: <Widget>[
            new ListTile
            (title: Text(item+"!"),
            subtitle: Text("Subtitulo!"),
            leading: Column(
                      children: <Widget>[Icon(Icons.wb_sunny), Icon(Icons.wb_cloudy)]), //Leading!! (Va al inicio)
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){},
            ), //Trailing (Va al final)
            Divider(color: Colors.black, thickness: 10.0)
          ],
          
        );
      }
    ).toList();

    return widgets;

  }
}
