import 'package:flutter/material.dart';
import 'package:peliculas_learning/src/widgets/CardSwiperWidget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Películas"),
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          _buildIconButton(),
          SizedBox(
            width: 120.0,
          )
        ],
      ),
      //body: SafeArea(child: Text("HomePage perras!!!")),
      body: Container(
        child: Column(
          children: <Widget>[_cardSwiper()],
        ),
      ),
    );
  }

  IconButton _buildIconButton() {
    return IconButton(
      icon: Icon(Icons.search),
      onPressed: () {},
    );
  }

  Widget _cardSwiper() {
    return CardSwiper(
      movies: [1,2,3,4,5],
    );
  }
}
