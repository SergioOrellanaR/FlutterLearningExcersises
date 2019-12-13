import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Página de alertas"),
        ),
        body: Center(
          child: RaisedButton(
            child: Text("Mostrar alerta"),
            color: Colors.blue,
            textColor: Colors.white,
            shape: StadiumBorder(),
            onPressed: () => _mostrarAlerta(context),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.keyboard_return),
            onPressed: () {
              Navigator.pop(context);
            }));
  }

  _mostrarAlerta(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            title: Text("Titulo de alerta"),
            content: Column(children: <Widget>[
              Text("Contenido de alerta 1!"),
              FlutterLogo(
                textColor: Colors.green,
                size: 100.0,
              ),
            ],
            mainAxisSize: MainAxisSize.min),
            actions: <Widget>[
              FlatButton(child: Text("Cancelar"), onPressed: ()=>Navigator.of(context).pop(),),
              FlatButton(child: Text("OK"), onPressed: ()=>Navigator.of(context).pop(),)
            ],
          );
        });
  }
}
