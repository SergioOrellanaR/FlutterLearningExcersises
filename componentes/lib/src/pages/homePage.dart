import 'package:flutter/material.dart';
import 'package:componentes/src/utils/iconToString.dart';
import 'package:componentes/src/providers/menuProvider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes"),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    // print(menuProvider.options);
    // menuProvider.loadData().then(
    //   (data)
    //   {
    //     print("_lista");
    //     print (data);
    //   }
    // );

    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(children: _createListitems(snapshot.data, context));
      },
    );
  }

  List<Widget> _createListitems(List<dynamic> list, BuildContext context) {
    
    final List<Widget> options = new List<Widget>();

    for (var item in list) {
      ListTile listTile = new ListTile(
        title: Text(item["texto"]),
        leading: getIcon(item["icon"], item["color"]),
        trailing: Icon(
          Icons.arrow_forward,
          color: Colors.blue,
        ),
        onTap: () {


          Navigator.pushNamed(context, item["ruta"]);


          //Para navegar mediante páginas estáticas
          // // final route =  MaterialPageRoute(
          // //   builder: (context) => AlertPage()
          // //   );   
          // // Navigator.push(context, route);
        },
      );

      options..add(listTile)..add(Divider());
    }

    // list.forEach((data) {
    //   ListTile listTile = new ListTile(
    //     title: Text(item["texto"]),
    //     leading: Icon(
    //       Icons.add_alert,
    //       color: Colors.red,
    //     ),
    //     trailing: Icon(
    //       Icons.arrow_forward,
    //       color: Colors.black,
    //     ),
    //     onTap: () {},
    //   );

    //   options..add(listTile)..add(Divider());
    // });

    return options;

    //Method does the same than commented.
    // List<Widget> listItems = new List<Widget>();

    // listItems..add(new ListTile( title: Text("Hello world!"),))
    //          ..add(Divider())
    //          ..add(new ListTile( title: Text("Hello world!"),))
    //          ..add(Divider())
    //          ..add(new ListTile( title: Text("Hello world!"),));

    // return listItems;
  }
}
