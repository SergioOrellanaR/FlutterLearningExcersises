import 'package:flutter/material.dart';
import 'package:peliculas_learning/src/models/MovieModel.dart';

class HorizontalMovie extends StatelessWidget {
  final List<Movie> movies;

  HorizontalMovie({@required this.movies});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      height: _screenSize.height * 0.25,
      child: PageView(
        children: _popularCards(context),
        //Efecto imán
        pageSnapping: true,
        controller: PageController(
            initialPage: 1, viewportFraction: 0.3, keepPage: true),
      ),
    );
  }

  _popularCards(BuildContext context) {
    return movies.map((movie) {
      return Container(
          margin: EdgeInsets.only(right: 15.0),
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  image: movie.getPosterImg(),
                  placeholder: AssetImage("assets/loadingGifs/GrayCat.gif"),

                ),
              ),
              SizedBox(height: 5.0,),
              
              Text(movie.title, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.caption,)
            ],
          ));
    }).toList();
  }
}
