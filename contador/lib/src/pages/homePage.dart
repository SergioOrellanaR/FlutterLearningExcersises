import 'package:flutter/material.dart';

//Este archivo no hace nada, pero es una demostración de implementación de StatelessWidget (De hecho, nisiquiera es referenciado).

class HomePage extends StatelessWidget {

  final TextStyle textStyle = new TextStyle(fontSize: 25.0);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Título"),
        centerTitle: true,
        elevation: 4.0,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Número de clicks: ", style: textStyle),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.thumb_up),
        onPressed: (){
          print("Presionó el botón");
        } ,
      ),
    );
  }
}
