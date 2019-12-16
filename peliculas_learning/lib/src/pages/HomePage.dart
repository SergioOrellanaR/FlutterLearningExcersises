import 'package:flutter/material.dart';
import 'package:peliculas_learning/src/models/MovieModel.dart';
import 'package:peliculas_learning/src/providers/moviesProvider.dart';
import 'package:peliculas_learning/src/widgets/CardSwiperWidget.dart';
import 'package:peliculas_learning/src/widgets/HorizontalMovieWidget.dart';

class HomePage extends StatelessWidget {
  final MoviesProvider provider = new MoviesProvider();

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
          children: <Widget>[_cardSwiper(), _footer(context)],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
    return FutureBuilder(
      future: MoviesProvider().getNowPlayingInCinema(),
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(
            movies: snapshot.data,
          );
        } else {
          return Container(
              height: 300.0,
              child: Center(child: new CircularProgressIndicator()));
        }
      },
    );

    // provider.getNowPlayingInCinema();
  }

  Widget _footer(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text("Populares", style: Theme.of(context).textTheme.subhead)),
          SizedBox(height: 20.0),
          FutureBuilder(
            future: MoviesProvider().getPopulars(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
              if (snapshot.hasData) {
                return HorizontalMovie(movies: snapshot.data);
              } else {
                return Center(child: new CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
      width: double.infinity,
    );
  }
}
