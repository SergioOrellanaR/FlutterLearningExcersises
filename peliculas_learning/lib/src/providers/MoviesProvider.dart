import 'dart:convert';

import 'package:peliculas_learning/src/models/MovieModel.dart';
import 'package:http/http.dart' as http;

class MoviesProvider {
  String _apikey = "bc0ebddecf9de597bca3a775c91fb0c4";
  String _url = "api.themoviedb.org";
  String _language = "es-CL";

  Future<List<Movie>> getNowPlayingInCinema() async 
  {
    String endpoint = "3/movie/now_playing";
    return callMoviesGetRest(endpoint);
  }

  Future<List<Movie>> getPopulars() async 
  {
    String endpoint = "3/movie/popular";
    return callMoviesGetRest(endpoint);
  }

  Future<List<Movie>> callMoviesGetRest(String endpoint) async 
  {
    final url = Uri.https(_url, endpoint,
        {"api_key": _apikey, "language": _language});

    final response = await http.get(url);

    // dynamic movies = new Movies();

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);

      final movies = new Movies.fromJsonList(decodedData["results"]);

      return movies.movieItems;

      //print (movies.movieItems[0].overview);
    } 
    else 
    {
      return [];
    }
  }





}
