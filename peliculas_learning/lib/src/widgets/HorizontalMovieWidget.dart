import 'package:flutter/material.dart';
import 'package:peliculas_learning/src/models/MovieModel.dart';

class HorizontalMovie extends StatelessWidget {
  final List<Movie> movies;

  final Function nextPage;

  final _pageController =
      new PageController(initialPage: 1, viewportFraction: 0.3, keepPage: true);

  HorizontalMovie({@required this.movies, @required this.nextPage});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    _pageController.addListener(() {
      //Si llega a final de página - 200 pixeles
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        nextPage();
      }
    });

    return Container(
      height: _screenSize.height * 0.25,
      //Pageview = Carga todo de una, PageView.Builder = Carga a medida que los datos sean necesitados.
      child: PageView.builder(
        itemBuilder: (context, i) {
          return _createPopularCard(context, movies[i]);
        },

        //children: _popularCards(context),
        //Efecto imán
        pageSnapping: true,
        controller: _pageController,
        itemCount: movies.length,
      ),
    );
  }

  // _popularCards(BuildContext context) {
  //   return movies.map((movie) {
  // return Container(
  // margin: EdgeInsets.only(right: 15.0),
  // child: Column(
  // children: <Widget>[
  // ClipRRect(
  // borderRadius: BorderRadius.circular(20.0),
  // child: FadeInImage(
  // image: movie.getPosterImg(),
  // placeholder: AssetImage("assets/loadingGifs/GrayCat.gif"),
  // //Setea un tamaño fijo de placeholder
  // height: 160.0,
  // fit: BoxFit.none,
  // //Iguala tamaño de imagen de placeholder a tamaño de imagen.
  // //// fit: BoxFit.cover,
  // ),
  // ),
  // SizedBox(
  // height: 5.0,
  // ),
  // Text(
  // movie.title,
  // overflow: TextOverflow.ellipsis,
  // style: Theme.of(context).textTheme.caption,
  // )
  // ],
  // ));

  //   }).toList();
  // }

  Widget _createPopularCard(BuildContext context, Movie movie) {

    movie.uniqueId = "${movie.id}_horizontal";

    final card = Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            Hero(
              tag: movie.uniqueId,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  image: movie.getPosterImg(),
                  placeholder: AssetImage("assets/loadingGifs/GrayCat.gif"),
                  //Setea un tamaño fijo de placeholder
                  height: 160.0,
                  fit: BoxFit.contain,
                  //Iguala tamaño de imagen de placeholder a tamaño de imagen.
                  //// fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              movie.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ));

    return GestureDetector(
      child: card,
      onTap: () {
        Navigator.pushNamed(context, "movieDetail", arguments: movie);
      },
    );
  }
}
