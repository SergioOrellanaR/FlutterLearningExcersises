import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas_learning/src/models/MovieModel.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;

  CardSwiper({@required this.movies});

  @override
  Widget build(BuildContext context) {
    //!!Trae información de alto y ancho de pantalla actual!!
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      // width: _screenSize.width * 0.7,
      // height: _screenSize.height * 0.5,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          movies[index].uniqueId = "${movies[index].id}_cards";


          // String imageId = movies[index].toString();
          final card = Hero(
            tag: movies[index].uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: movies[index].getPosterImg(),
                fit: BoxFit.cover,
                placeholder: AssetImage("assets/loadingGifs/GrayCat.gif"),
              ),
            ),
          );

          return GestureDetector(
            child: card,
            onTap: () {
              Navigator.pushNamed(context, "movieDetail",
                  arguments: movies[index]);
            },
          );

        },
        // pagination: new SwiperPagination(),
        // control: new SwiperControl(),
        layout: SwiperLayout.STACK,
        itemCount: movies.length,
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
      ),
    );
  }
}
