import 'package:componentes/src/routes/nekoRouteImage.dart';
import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {


  NetworkImage avatarImage = routeNeko()["GothNekoGirl"];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página de avatares"),
        actions: <Widget>
        [
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: avatarImage,
              radius: 21.0,
            ),
          ),


          // Container(
          //   margin: EdgeInsets.only(right: 10.0),
          //   child: CircleAvatar(
          //     child: Text("SO"),
          //     backgroundColor: Colors.green,
          //   ),
          // )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: routeNeko()["BoringNekoGirl"],
          placeholder: AssetImage("assets/GrayCat.gif"),
          fadeInDuration: Duration( milliseconds: 200),
          width: 550.0,
          height: 550.0,

        ),
        ),
    );
  }
}