import 'package:flutter/material.dart';
import 'package:peliculas_learning/src/models/MovieModel.dart';
import 'package:peliculas_learning/src/providers/moviesProvider.dart';
import 'package:peliculas_learning/src/search/SearchDelegate.dart';
import 'package:peliculas_learning/src/widgets/CardSwiperWidget.dart';
import 'package:peliculas_learning/src/widgets/HorizontalMovieWidget.dart';

class HomePage extends StatelessWidget {
  final MoviesProvider provider = new MoviesProvider();

  @override
  Widget build(BuildContext context) {

    provider.getPopulars();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Películas"),
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          _buildIconButton(context),
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

  IconButton _buildIconButton(BuildContext context ) {
    return IconButton(
      icon: Icon(Icons.search),
      onPressed: () 
      {
        showSearch(context: context, delegate: MovieSearch()/* , query: "Mensaje predeterminado" */);
      },
    );
  }

  Widget _cardSwiper() {
    return FutureBuilder(
      future: provider.getNowPlayingInCinema(),
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
              child: Text("Populares",
                  style: Theme.of(context).textTheme.subhead)),
          SizedBox(height: 20.0),
          StreamBuilder(
            stream: provider.popularsStream,
            builder:
                (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
              if (snapshot.hasData) {
                return HorizontalMovie(movies: snapshot.data, nextPage: provider.getPopulars,);
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
