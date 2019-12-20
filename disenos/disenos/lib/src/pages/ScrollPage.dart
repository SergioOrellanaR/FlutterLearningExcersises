import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(children: <Widget>[
        _page1(),
        _page2(context),
      ],
      scrollDirection: Axis.vertical,)
      
    );
  }

  Widget _page1() 
  {
    return Stack
    (children: <Widget>[
      _backgroundColor(Colors.greenAccent),
      _backgroundImage(),
      _createTexts()
      

    ],);
  }

  Widget _page2(BuildContext context) 
  {
    
    ////La mitad de la pantalla (?);
    //final _screenSize = MediaQuery.of(context).size;
    // double half = _screenSize.width*0.42;

    return Stack
    (children: <Widget>[
      _backgroundColor(Colors.greenAccent),
      _createTopArrow(),
      _createButton(),
      
      

    ],);
  }

  _backgroundColor(MaterialAccentColor color) 
  {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: color,
    );
  }

  Widget _backgroundImage() 
  {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(image: AssetImage("assets/scroll-1.png"), fit: BoxFit.cover,),
    );
  }

  Widget _createTexts() 
  {
    String day = DateFormat('EEEE').format(DateTime.now());

    // initializeDateFormatting("fr_FR", null).then((_) 
    // {
    //   
    // });
    

    final textStyles = TextStyle(color: Colors.white, fontSize: 50.0);
    
    
    return Column(children: <Widget>[
      SafeArea(child: SizedBox(height: 50.0,)),
      Text("11°", style: textStyles,),
      Text(day, style: textStyles,),
      Expanded(
        child: Container(),
      ),
      Icon (Icons.keyboard_arrow_down, size: 70.0, color: Colors.white,),
    ],);
  }

  Widget _createButton() 
  {
    return Center(
      child: RaisedButton(
        child: Padding(
          //EdgeInsets.symetric para distintos valores UwU
          padding: EdgeInsets.all(30.0),
          child: Text("Bienvenidos UwU", style: TextStyle(fontSize: 20.0),),
        ),
        onPressed: (){},
        color: Colors.blueGrey,
        shape: StadiumBorder(),
        textColor: Colors.lightGreenAccent,),
    );

  }

  Widget _createTopArrow() 
  {
    // Padding( padding: EdgeInsetsDirectional.only(start: half),child: SafeArea(child: Icon (Icons.keyboard_arrow_up, size: 70.0, color: Colors.white,))),
    return Column(children: <Widget>[
      SafeArea(child: SizedBox(height: 1.0,)),
      Icon (Icons.keyboard_arrow_up, size: 70.0, color: Colors.white,),
      Expanded(
        child: Container(),
      ),
    ],);
  }
}