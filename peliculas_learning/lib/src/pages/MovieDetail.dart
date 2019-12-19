import 'package:flutter/material.dart';
import 'package:peliculas_learning/src/models/MovieModel.dart';

class MovieDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        _createAppbar(movie),
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(
              height: 10.0,
            ),
            _posterTitle(movie, context),
            _description(movie),
          ]),
        )
      ],
    ));
  }

  _createAppbar(Movie movie) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigo,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          movie.title,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
            image: movie.getBackdropPath(),
            placeholder: AssetImage("assets/loadingGifs/loading.gif"),
            fadeInDuration: Duration(milliseconds: 150),
            fit: BoxFit.cover),
      ),
    );
  }

  _posterTitle(Movie movie, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              image: movie.getPosterImg(),
              height: 150.0,
            ),
          ),
          SizedBox(width: 20.0,),
          Flexible(
            child: Column(
              children: <Widget>[
                Text(movie.title, style: Theme.of(context).textTheme.title, overflow: TextOverflow.ellipsis,),
                Text(movie.originalTitle, style: Theme.of(context).textTheme.subhead, overflow: TextOverflow.ellipsis),
                Row(children: <Widget>[
                  SizedBox(width: 85.0,),
                  Icon(Icons.stars, color: Colors.deepOrange,),
                  Text(movie.voteAverage.toString()+"/10")
                ],)


              ],
            ),
          )
        ],
      ),
    );
  }

  _description(Movie movie) 
  {
    return Container
    (
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
