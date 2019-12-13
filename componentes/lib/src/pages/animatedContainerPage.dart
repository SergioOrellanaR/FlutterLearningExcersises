import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.yellowAccent;
  BorderRadiusGeometry _borderRadiusGeometry = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contenedor animado!"),
        ),
      body: Center(
        child: AnimatedContainer(
          width : _width,
          height: _height,
          decoration: BoxDecoration(borderRadius: _borderRadiusGeometry, color : _color),
          duration: Duration(milliseconds: 500),
          curve: Curves. easeInBack,
          //child: ,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.grade),
          onPressed: _changeImage)
          );
  }


  void _changeImage()
  {
    final random = Random();
    int min = 60;
    int max = 250;
    


    setState(() {
      _width  = (min + random.nextInt(max-min)).toDouble();
      _height = (min + random.nextInt(max-min)).toDouble();
      _color  = Color.fromRGBO(
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255), 
        1.0);

      int maxRadius = 200;

      _borderRadiusGeometry = new BorderRadiusDirectional.circular(random.nextInt(maxRadius).toDouble());
    });
  }
}
