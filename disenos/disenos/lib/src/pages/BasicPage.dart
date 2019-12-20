import 'package:flutter/material.dart';

class BasicPage extends StatelessWidget {

  final titleStyle    = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final subtitleStyle = TextStyle(fontSize: 18.0, color     : Colors.grey);


  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      //body : Listview ////y convierte en listadeslizable :P
      body: SingleChildScrollView
      (
        child: Column(
          children: <Widget>
          [
            _buildImage(),
            _buildHeaderInformation(),
            _createActions(),
            _createTextDetail(),
          ],
        ),
      )
    );
  }

  Widget _buildImage() => Container(width: double.infinity, child: Image(image: NetworkImage("https://pixnio.com/free-images/2017/08/31/2017-08-31-06-03-56-1000x667.jpg"), fit: BoxFit.cover,));

  Widget _buildHeaderInformation() {
    return SafeArea(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
              child: Row(children: <Widget>[

                Expanded(
                  child: Column(children: <Widget>
                  [
                    Text("Paisaje frio",                style: titleStyle,),
                    SizedBox(height: 7.0,),
                    Text("Como el corazón de ella UwU", style: subtitleStyle,)
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),

                Icon(Icons.star, color: Colors.lightBlueAccent, size: 30.0,),
                Text("10", style: TextStyle(fontSize: 20.0),)

                
              ],),
            ),
    );
  }

  

  Widget _createActions() 
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _action(Icons.call,     "CALL"),
        _action(Icons.near_me,  "ROUTE"),
        _action(Icons.share,    "SHARE"),
      ],
    );
  }

  Widget _action(IconData icon, String text)
  {
    return Column(children: <Widget>[
          Icon(icon, color: Colors.blue, size: 50.0,),
          SizedBox(height: 5.0,),
          Text(text, style: TextStyle(fontSize: 15.0, color: Colors.blue))
        ],);

  }

  Widget _createTextDetail() 
  {
    return SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        child: Text("Pariatur anim laborum veniam incididunt tempor consequat. Magna adipisicing mollit dolor enim proident anim proident officia anim dolor officia deserunt. Consequat consequat nisi pariatur non laboris ea laborum et sunt nulla amet culpa tempor labore.",
        textAlign: TextAlign.justify,)),
    );
  }
}
