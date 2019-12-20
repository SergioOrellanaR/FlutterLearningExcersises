import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class BeautifulPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            _setBackground(),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _setTitles(),
                  _roundedButtons(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: _bottomNavigationBar(context));
  }

  _setBackground() {
    final gradient = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0),
          ],
              //Eje X de 0(Full izquierda) a 1 (Full derecha), Eje Y de 0 (Full arriba) a 1 (Full abajo)
              begin: FractionalOffset(0.5, 0.0),
              end: FractionalOffset(0.5, 1.0))),
    );

    final backBox = Transform.rotate(
        angle: -pi / 5.0,
        child: Container(
          // transform: Matrix4.rotationZ(0.5),
          height: 360.0,
          width: 360.0,
          decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(80.0),
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(236, 98, 188, 1.0),
                  Color.fromRGBO(241, 142, 172, 1.0),
                ],
              )),
        ));

    return Stack(
      children: <Widget>[
        gradient,
        Positioned(
          child: backBox,
          top: -75.0,
        )
      ],
    );
  }

  Widget _setTitles() {
    TextStyle titleStyle = TextStyle(
        color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold);
    TextStyle subTitleStyle = TextStyle(color: Colors.white, fontSize: 18);

    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Este es un titulo UwU",
              style: titleStyle,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Este es un sub título UwU",
              style: subTitleStyle,
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return Theme(
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
                size: 30.0,
              ),
              title: Container()),
          BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart_outlined, size: 30.0),
              title: Container()),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle, size: 30.0),
              title: Container())
        ],
        // backgroundColor: Color.fromRGBO(52, 54, 101, 1.0),
      ),
      data: Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(52, 54, 101, 1.0),
          primaryColor: Colors.pinkAccent,
          textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0)))),
    );
  }

  _roundedButtons() {
    return Table(
      children: [
        TableRow(children: [
          _createRoundedButton(
              "General", Icons.border_all, Colors.blue),
          _createRoundedButton(
              "Bus", Icons.directions_bus, Colors.purpleAccent),
        ]),
        TableRow(children: [
          _createRoundedButton(
              "Avión", Icons.airplanemode_active, Colors.lightBlue),
          _createRoundedButton(
              "Barco", Icons.directions_boat, Colors.indigoAccent),
        ]),
        TableRow(children: [
          _createRoundedButton(
              "Bicicleta", Icons.directions_bike, Colors.green),
          _createRoundedButton(
              "Caminar", Icons.directions_walk, Colors.black),
        ]),
        TableRow(children: [
          _createRoundedButton(
              "Metro", Icons.directions_subway, Colors.purpleAccent),
          _createRoundedButton(
              "Tren", Icons.directions_railway, Colors.brown),
        ])
      ],
    );
  }

  _createRoundedButton(String text, IconData iconData, Color color) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: 180.0,
          //Margen entre valores de table
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                height: 5.0,
              ),
              CircleAvatar(
                child: Icon(iconData, color: Colors.white, size: 30.0),
                radius: 35.0,
                backgroundColor: color,
              ),
              Text(
                text,
                style: TextStyle(color: color),
              ),
              SizedBox(
                height: 5.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
