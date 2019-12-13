import 'package:componentes/src/routes/nekoRouteImage.dart';
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cutie Cards"),
      ),
      body: ListView(
          children: cardPageContent(),
          padding:
              //EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
              EdgeInsets.all(10.0)),
    );
  }

  Widget _cardAlpha() {
    return Card(
      child: Column(children: <Widget>[
        ListTile(
          leading: Icon(
            Icons.photo_album,
            color: Colors.blue,
          ),
          title: Text("Galería neko girls!"),
          subtitle: Text(
              "Esta página muestra tarjetas de neko girls, para placer del usuario, que sepa que la selección se ha realizado de forma cuidadosa para satisfacer sus necesidades."),
        ),
        Divider(),
        Row(
          children: <Widget>[
            FlatButton(
              child: Text("Cancelar"),
              onPressed: () {},
              textColor: Colors.blue,
            ),
            FlatButton(
              child: Text("Avanzar"),
              onPressed: () {},
              textColor: Colors.blue,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.end,
        )
      ]),
      borderOnForeground: true,
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      elevation: 10.0,
      semanticContainer: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    );
  }

  List<Widget> _cardBeta() {

    List<Container> containers = [];

    routeNeko().forEach((key, value) {
      Card card = Card(
        clipBehavior: Clip.antiAlias,
        elevation: 15.0,
        borderOnForeground: true,
        shape: CircleBorder(),
        child: Column(
          children: <Widget>[
            FadeInImage(
              image: value,
              placeholder: AssetImage("assets/GrayCat.gif"),
              fadeInDuration: Duration(milliseconds: 200),
              height: 500.0,
              width: 500.0,
            ),
            // Image(image: images["GothNekoGirl"],
            // height: 200.0,),
            Container(
              padding: EdgeInsets.all(0), 
              child: Divider(),
            ),
            // FadeInImage(image: images["BlondeNekoGirl"],
            // fit: BoxFit.cover,
            // placeholder: AssetImage("assets/GrayCat.gif"),
            // fadeInDuration: Duration(milliseconds: 200))
          ],
        ),
      );

      Container container = Container(
        child: ClipRRect(
          child: card,
          borderRadius: BorderRadius.circular(00.0)
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(300.0),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 60.0,
                spreadRadius: -85.0,
                offset: Offset(50.0, 60.0))
          ], // color: Colors.red,
        ),
      );
      containers.add(container);
    });

    return containers;
  }

  List<Widget> cardPageContent()
  {
    List<Widget> headerCard = [SizedBox(
                height: 30.0),
                _cardAlpha()];
    List<Widget> contentList = _cardBeta();
    
    //Increiblemente esto combina las dos listas, y devuelve una nueva.
    return headerCard+contentList;
  }
}
