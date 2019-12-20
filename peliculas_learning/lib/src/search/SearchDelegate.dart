import 'package:flutter/material.dart';
import 'package:peliculas_learning/src/models/MovieModel.dart';
import 'package:peliculas_learning/src/providers/MoviesProvider.dart';

//Clase para implementación de buscadores.

class MovieSearch extends SearchDelegate {

  String selection;
  final moviesProvider = new MoviesProvider();

  // final movies = [
  //   "Meme",
  //   "Spiderman",
  //   "asda",
  //   "cccccc",
  //   "Capitan américa",
  //   "111111"
  // ];
  // final recientes = ["Spiderman", "Capitan américa"];

  @override
  List<Widget> buildActions(BuildContext context) {
    //Las acciones del AppBar (Por ejemplo, icono para limpiar texto).
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          // print("Click de buildActions");
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del AppBar (El leading, el que está normalmente antes de la escritura)-
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        // print("Click de buildLeading");
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados que se mostrarán
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blue,
        child: Text(selection),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    } 
    else 
    {
      return FutureBuilder(
        future: moviesProvider.searchMovie(query),
        builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
          final movies = snapshot.data;

          if (snapshot.hasData) {
            return ListView(
                children: movies.map((movie) {
              return ListTile(
                leading: FadeInImage(image: movie.getPosterImg(),
                placeholder: AssetImage("assets/loadingGifs/GrayCat.gif"),
                width: 50.0,
                fit: BoxFit.contain,),
                title: Text(movie.title),
                subtitle: Text(movie.originalTitle),
                onTap: ()
                {
                  close(context, null);
                  movie.uniqueId = "";
                  Navigator.pushNamed(context, "movieDetail", arguments: movie);
                },
              );
            }).toList());
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    }
  }

  // @override
  // Widget buildSuggestions(BuildContext context) {
  //   // Las sugerencias que aparecen a medida que se va escribiendo.
  //   ////LinQ OMG
  //   final suggestedList = ( query.isEmpty) ? recientes : movies.where( (p) => p.toLowerCase().startsWith(query.toLowerCase()) ).toList();

  //   return ListView.builder(
  //     itemCount: suggestedList.length,
  //     itemBuilder: (context, i)
  //     {
  //       return ListTile(
  //         leading: Icon(Icons.movie_filter),
  //         title: Text(suggestedList[i]),
  //         onTap: (){
  //           selection = suggestedList[i];
  //           showResults(context);
  //         },);
  //     },
  //   );
  // }

}
